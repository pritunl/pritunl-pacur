#!/bin/bash
set -e

update_pkgbuild() {
    local package_name="$1"
    local repo="pritunl/$2"
    local pkgbuild_dir="$package_name"

    if [[ ! -f "$pkgbuild_dir/PKGBUILD" ]]; then
        echo "PKGBUILD file not found in $pkgbuild_dir"
        return 1
    fi

    local latest_version
    latest_version=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | jq -r '.tag_name')

    sed -i "s/pkgver=\"[^\"]*\"/pkgver=\"$latest_version\"/" "$pkgbuild_dir/PKGBUILD"

    local tar_url="https://github.com/$repo/archive/refs/tags/$latest_version.tar.gz"
    local latest_sha256
    latest_sha256=$(curl -L "$tar_url" | sha256sum | awk '{print $1}')

    sed -i "0,/hashsums=(/{n;s/[a-f0-9]\{64\}/$latest_sha256/;}" "$pkgbuild_dir/PKGBUILD"
}

update_pkgbuild "pritunl" "pritunl"
update_pkgbuild "pritunl-client" "pritunl-client-electron"
update_pkgbuild "pritunl-client-electron" "pritunl-client-electron"
update_pkgbuild "pritunl-cloud" "pritunl-cloud"
update_pkgbuild "pritunl-endpoint" "pritunl-endpoint"
update_pkgbuild "pritunl-link" "pritunl-link"
update_pkgbuild "pritunl-ssh" "pritunl-zero-client"
update_pkgbuild "pritunl-ssh-host" "pritunl-zero-client"
update_pkgbuild "pritunl-zero" "pritunl-zero"
