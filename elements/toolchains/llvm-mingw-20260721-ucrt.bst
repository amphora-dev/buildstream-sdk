kind: manual

description: |
  LLVM-MinGW 20260721 UCRT toolchain (upstream mstorsjo release, LLVM 22.1.8)
  for x86_64 Linux hosts, with aarch64, arm64ec and i686 Windows targets.

  This is the llvm-mingw version ValveSoftware/Proton
  experimental-11.0-20261027b builds its PE side with (docker/Makefile,
  LLVM_MINGW_VERSION). Amphora's Wine follows that tag, so it uses the same
  compiler release.

depends:
- filename: host/noble-amd64.bst
  type: build

sources:
- kind: tar
  url: llvm-mingw-upstream:20260721/llvm-mingw-20260721-ucrt-ubuntu-22.04-x86_64.tar.xz
  ref: 4a9fd7ac5bda8a0a514f33c4ad7864a76e58c56ed958be18221c5ca0ac0a2b10
  base-dir: llvm-mingw-20260721-ucrt-ubuntu-22.04-x86_64

config:
  install-commands:
  - |
    set -eu
    root="%{install-root}/opt/llvm-mingw"
    mkdir -p "$root"
    cp -a . "$root/"
    for tool in llvm-dlltool llvm-strip clang \
                aarch64-w64-mingw32-clang arm64ec-w64-mingw32-clang \
                i686-w64-mingw32-clang; do
      test -x "$root/bin/$tool"
    done

  strip-commands: []
