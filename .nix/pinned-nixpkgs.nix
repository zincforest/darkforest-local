{ system ? builtins.currentSystem
, config ? {}
, overlays ? []
}:
let
  fetch-nixpkgs = {
      owner ? "NixOS"
    , repo ? "nixpkgs"
    , rev
    , sha256
  }: import (builtins.fetchTarball {
    url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
    inherit sha256;
  }) { inherit system config overlays; };

  fakeSha256 = (import <nixpkgs> {}).lib.fakeSha256;
in {
 "21_11" = {
    "2022_01_26" = fetch-nixpkgs {
      rev = "65caf7cf6d705b61e053dc93e21249f8b7cf8dbf";
      sha256 = "14gjc7nk2kqvzpwg6mgvp8xjsqb1nk1jdx1ld4csdqcd4knlxrkk";
    };
  };
}
