{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e8eb0ced9f4d8c424d0b854b55fbdb2ecc60d201.tar.gz") {} }:

pkgs.mkShellNoCC {
  packages = with pkgs; [
    python312
  ];
}
