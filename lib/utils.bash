#!/usr/bin/env bash

set -euo pipefail

source "${plugin_dir}/lib/logging.bash"

GH_ORG_REPO="sagernet/sing-box"
GH_REPO="https://github.com/$GH_ORG_REPO"
TOOL_NAME="sing-box"

fail() {
	log_error "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# if [ -n "${GITHUB_API_TOKEN:-}" ]; then
# 	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
# fi

# sort_versions() {
# 	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
# 		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
# }

# list_github_tags() {
# 	git ls-remote --tags --refs "$GH_REPO" |
# 		grep -o 'refs/tags/.*' | cut -d/ -f3- |
# 		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
# }

list_github_api_versions() {
	curl "${curl_opts[@]}" "https://api.github.com/repos/$GH_ORG_REPO/releases" | jq 'map(.name).[]' | tr -d '"'
}

list_all_versions() {
	# list_github_tags
	list_github_api_versions
}

download_release() {
	local version filename url
	filename="$1"
	output_path="$2"
	version="$3"

	# url="$GH_REPO/archive/v${version}.tar.gz"
	url="$GH_REPO/releases/download/v$version/$filename"

	log_info "* Downloading $TOOL_NAME release $filename..."
	curl "${curl_opts[@]}" -o "$output_path" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		# Assert sing-box executable exists.
		local tool_cmd
		# tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		tool_cmd="sing-box"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
