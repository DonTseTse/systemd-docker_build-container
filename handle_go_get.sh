#! /bin/bash

### Parameters
# 1 - repository to build (URL/path in go get style, where the web https://github.com/<username>/<repo_name>.git has to be written github.com/<username>/<repo_name>
 
### Preparation
script_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

### Process
go_version=$(go version)
echo "[Compilation container] Info: $go_version"
echo "[Compilation container] Executing go get $1";
go get "$1" 
if [ $? -eq 0 ]; then
	echo "[Compilation container] Success"
	# Overwrite check
	if [ -f "$script_folder/systemd-docker" ]; then
		echo "[Compilation container] Overwriting old systemd-docker"
	fi
	cp /go/bin/systemd-docker "$script_folder/systemd-docker"
else
	error_code_return=$?
	echo "[Compilation container] Error, go get failed with error code $error_code_return"
	exit $error_code_return
fi
