kind: import

description: |
  Amphora host build SDK based on Ubuntu Base 24.04.4 amd64.

  Includes GCC/G++, Autotools, CMake, Meson/Ninja, Perl/Python/Mako/PyYAML and
  common native build tools. The archive is immutable and SHA-256 pinned.

sources:
- kind: tar
  url: sdk-release:host-sdk-noble-amd64-20260804/host-sdk-noble-amd64-20260804.tar.xz
  ref: 8fc9db6a51633409728a5cb0caa3b0d9e9685e7167c15a2987b3da021eb94918
  base-dir: ""
