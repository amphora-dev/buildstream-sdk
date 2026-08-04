kind: manual

description: |
  LLVM-MinGW 20250920 UCRT toolchain for x86_64 Linux hosts.

depends:
- filename: host/noble-amd64.bst
  type: build

sources:
- kind: tar
  url: llvm-mingw:20250920/llvm-mingw-20250920-ucrt-ubuntu-22.04-x86_64.tar.xz
  ref: 8dd8c34fc051a50c2fae86015f35057f8aae93fe1e19b34537ef1269a8b4c772
  base-dir: llvm-mingw-20250920-ucrt-ubuntu-22.04-x86_64

config:
  install-commands:
  - |
    set -eu
    root="%{install-root}/opt/llvm-mingw"
    mkdir -p "$root"
    cp -a . "$root/"
    test -x "$root/bin/llvm-dlltool"
    test -x "$root/bin/x86_64-w64-mingw32-clang"
    test -x "$root/bin/i686-w64-mingw32-clang"

  strip-commands: []
