#!/usr/bin/env bash

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

log_error() {
	echo -e "${RED}[ERROR]" "$@" "${NC}"
}

log_info() {
	echo -e "${GREEN}[INFO]" "$@" "${NC}"
}

log_warn() {
	echo -e "${YELLOW}[WARN]" "$@" "${NC}"
}
