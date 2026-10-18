{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e8eb0ced9f4d8c424d0b854b55fbdb2ecc60d201.tar.gz") {} }:

let
  pypyBinary = pkgs.stdenv.mkDerivation {
    pname = "pypy3.9-binary";
    version = "7.3.15";

    src = pkgs.fetchurl {
      url = "https://downloads.python.org/pypy/pypy3.9-v7.3.15-macos_x86_64.tar.bz2";
      sha256 = "sha256-GK18nLkcXo751ARCsv0fY5KuETeUxba306ReBPGe3sY=";
    };

    installPhase = ''
      mkdir -p $out
      cp -r * $out/
    '';
  };
in
pkgs.mkShellNoCC {
  packages = [
    pkgs.python312
    pypyBinary
  ];
}
