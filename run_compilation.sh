### Parameters
go_get_repository_uri="github.com/dontsetse/systemd-docker"

if [ ! -z "$1" ]; then
	go_get_repository_uri="$1"
fi

### Preparation
script_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

overwrite=0
if [ -f "$script_folder/systemd-docker" ]; then
	echo "[Compilation script] $script_folder/systemd-docker already exists, overwrite? Confirm with y, anything else or Ctrl+C to abort"
	read ok
	if [ ! "$ok" = "y" ]; then
		exit 1
	fi
	overwrite=1
fi

### Process
docker run --mount type=bind,source="$script_folder",target=/compilation --rm -it golang:latest \
       /bin/bash /compilation/handle_go_get.sh "$go_get_repository_uri"

docker_return=$?
if [ $overwrite -eq 1 ]; then
	if [ $docker_return -eq 0 ]; then
		echo "[Compilation script] Success, $script_folder/systemd-docker overwritten"
	else
		echo "[Compilation script] Failure. $script_folder/systemd-docker was not touched."
	fi
else
	if [ $docker_return -eq 0 ]; then
                echo "[Compilation script] Success. Compiled systemd-docker available at $script_folder/systemd-docker"
        else
                echo "[Compilation script] Failure"
        fi
fi
