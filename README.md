# buildstream-sdk

Shared, immutable BuildStream foundations for Amphora repositories.

## Published elements

| Element | Purpose |
|---|---|
| `host/noble-amd64.bst` | GCC/G++, Autotools, CMake, Meson/Ninja, Python/Perl host SDK |
| `toolchains/android-ndk-r29.bst` | Android NDK r29 at `/opt/android-ndk` |
| `toolchains/llvm-mingw-20250920-ucrt.bst` | LLVM-MinGW UCRT at `/opt/llvm-mingw` |
| `profiles/android-cross-files.bst` | Shared AArch64, x86_64/API35 and native Meson profiles |

The host SDK Release is immutable:

```text
tag: host-sdk-noble-amd64-20260804
asset: host-sdk-noble-amd64-20260804.tar.xz
sha256: 8fc9db6a51633409728a5cb0caa3b0d9e9685e7167c15a2987b3da021eb94918
```

`config/host-sdk.lock` pins the Ubuntu snapshot, base archive, Meson wheel and
final archive. It fails closed if any generated content drifts. Updating the
SDK requires reviewing the dpkg/pip manifests and publishing a new tag;
existing Releases are never overwritten.

## Consume as a junction

In a consumer project:

```yaml
# elements/amphora-sdk.bst
kind: junction

sources:
- kind: git
  url: https://github.com/amphora-dev/buildstream-sdk.git
  ref: <exact-sdk-repository-commit>
```

Use shared elements:

```yaml
depends:
- filename: host/noble-amd64.bst
  junction: amphora-sdk.bst
  type: build

- filename: toolchains/android-ndk-r29.bst
  junction: amphora-sdk.bst
  type: build
```

Stage the profile artifact where package cross files expect it:

```yaml
- filename: profiles/android-cross-files.bst
  junction: amphora-sdk.bst
  type: build
  config:
    location: /opt/amphora-sdk/profiles
```

## Local setup

```bash
sudo apt-get install bubblewrap fuse3 git lzip patch python3-venv xz-utils
bash scripts/install-buildstream.sh
bin/bst show host/noble-amd64.bst
```

## Repository boundary

This repository owns only reusable build infrastructure:

- host SDK generation and package locks
- Android NDK artifacts
- generic cross/native profiles
- pinned BuildStream/BuildBox installer

Application package graphs, patches and final WCP/TZST/imagefs packaging remain
in their product repositories.
