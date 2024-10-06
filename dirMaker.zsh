#!/bin/zsh

if [ -z "$1" ]; then
    echo "Usage: dirMaker <number of exercises>"
    exit 1
fi

fail() {
    rm -rf "$newHWDir"
    echo "Failed to create directories, manual operations are needed."
    exit 1
}

newHWNo=$(($(find . -maxdepth 1 -name 'HW*' -type d | wc -l) + 1))
newHWDir="HW$newHWNo"

mkdir -p "$newHWDir"
if [ $? -ne 0 ]; then
    fail
fi

for i in {1..$1}; do
    mkdir -p "./$newHWDir/e$i"
    if [ $? -ne 0 ]; then
        fail
    fi
done

echo "Done：$(tree $newHWDir)"

