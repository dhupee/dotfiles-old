#!/usr/bin/bash

# This script is not mine, it's from Ratnadeep Bhattacharyya
# Based from this blog: https://skylab.hashnode.dev/platformio-with-neovim

# Compile the project
pio run -t compiledb

# Clean up existing define files
rm -f _compiler_defines.h compiler_defines.h clang_defines.h

# Generate defines for clang
clang -dM -xc++ /dev/null -c -v -E 2>/dev/null | sed "s/\([^[:space:]]\+[[:space:]]\+[^[:space:]]\+\)\(.*\)/\1/;s/#define/#undef/" >clang_defines.h

# Iterate through compile_commands.json and extract compiler defines
for comp in $(cat compile_commands.json | grep -E "\"command\": \"[^[:space:]]* -o" | sed 's:"command"\: "::g; s:-o.*::g' | sort | uniq); do
    set -x
    $comp -dM -E -xc++ /dev/null >>_compiler_defines.h
    set +x
done

# Combine defines from clang and extracted defines
cat clang_defines.h >compiler_defines.h
cat _compiler_defines.h | sort | uniq >>compiler_defines.h

# Clean up temporary define files
rm -f _compiler_defines.h clang_defines.h

# Update compile_commands.json with additional include flags
sed -i "s:.cpp\",:.cpp -include $${PWD}/compiler_defines.h\",:" compile_commands.json
sed -i "s:.c\",:.c -include $${PWD}/compiler_defines.h\",:" compile_commands.json

# Generate makefile
MKFILE="
# Uncomment lines below if you have problems with $PATH
#SHELL := /bin/bash
#PATH := /usr/local/bin:$(PATH)

all:
	platformio -f  run

upload:
	platformio -f  run --target upload

clean:
	platformio -f  run --target clean

program:
	platformio -f  run --target program

uploadfs:
	platformio -f  run --target uploadfs

update:
	platformio -f  update
"
echo "$MKFILE" >./Makefile
