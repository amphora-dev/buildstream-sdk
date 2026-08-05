kind: manual

description: |
  Android NDK r29 as a content-addressed BuildStream artifact.

depends:
- filename: host/noble-amd64.bst
  type: build

sources:
- kind: zip
  url: google-android:android-ndk-r29-linux.zip
  ref: 4abbbcdc842f3d4879206e9695d52709603e52dd68d3c1fff04b3b5e7a308ecf
  base-dir: android-ndk-r29

config:
  install-commands:
  - |
    set -eu
    mkdir -p "%{install-root}%{ndk-root}"
    cp -a . "%{install-root}%{ndk-root}/"
    bindir="%{install-root}%{ndk-toolchain}/bin"
    for candidate in "$bindir"/*; do
      [ -f "$candidate" ] || continue
      [ "$(wc -c < "$candidate")" -lt 128 ] || continue
      target="$(cat "$candidate")"
      case "$target" in
        *[!A-Za-z0-9._+-]*|"") continue ;;
      esac
      [ -e "$bindir/$target" ] || continue
      rm "$candidate"
      ln -s "$target" "$candidate"
    done
    find "$bindir" -type f -exec chmod 0755 {} +
    test -L "$bindir/clang"
    test -L "$bindir/llvm-strip"
    test -x "$bindir/aarch64-linux-android26-clang"
    test -x "$bindir/x86_64-linux-android28-clang"
    test -x "$bindir/x86_64-linux-android30-clang"

  strip-commands: []
