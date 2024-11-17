#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <name> [number_of_releases_to_keep]"
    exit 1
fi

name="$1"
keep_count="${2:-1}"

is_version_newer() {
    local ver1=(${1//./ })
    local ver2=(${2//./ })
    local i

    for i in {0..3}; do
        if (( ${ver1[i]:-0} > ${ver2[i]:-0} )); then
            return 0
        elif (( ${ver1[i]:-0} < ${ver2[i]:-0} )); then
            return 1
        fi
    done
    return 1
}

declare -A versioned_files
for file in ${name}/${name}*; do
    version=$(echo "$file" | grep -oP '\d+\.\d+\.\d+\.\d+')

    if [ -n "$version" ]; then
        versioned_files["$version"]+="$file "
    fi
done

versions=("${!versioned_files[@]}")

for ((i = 0; i < ${#versions[@]}; i++)); do
    for ((j = i + 1; j < ${#versions[@]}; j++)); do
        if is_version_newer "${versions[j]}" "${versions[i]}"; then
            temp="${versions[i]}"
            versions[i]="${versions[j]}"
            versions[j]="$temp"
        fi
    done
done

versions_to_keep=("${versions[@]:0:$keep_count}")

echo "Keeping all files for the newest $keep_count versions for $name:"
for version in "${versions_to_keep[@]}"; do
    for file in ${versioned_files[$version]}; do
        echo "Keeping newer version file: $file"
    done
done

for version in "${versions[@]:$keep_count}"; do
    for file in ${versioned_files[$version]}; do
        echo "Deleting older version file: $file"
        sudo rm $file
    done
done
