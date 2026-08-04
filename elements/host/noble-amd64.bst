kind: import

description: |
  Amphora host build SDK based on Ubuntu Base 24.04.4 amd64.

  Includes GCC/G++, Autotools, CMake, Meson/Ninja, Perl/Python/Mako/PyYAML and
  common native build tools. The archive is immutable and SHA-256 pinned.

sources:
- kind: tar
  url: sdk-release:host-sdk-noble-amd64-94277669/host-sdk-noble-amd64-94277669.tar.xz
  ref: 942776693e88cdc95a93e2e9b351e75f3a8be1fddfa1b85d3081787946852af3
  base-dir: ""
