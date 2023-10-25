{
  description = "A flake to build qemu-bpmp";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }: let
    systems = with flake-utils.lib.system; [
      x86_64-linux
      aarch64-linux
    ];
  in
    flake-utils.lib.eachSystem systems (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        packages.default = nixpkgs.legacyPackages.${system}.callPackage ./nix/default.nix {};
        formatter = nixpkgs.legacyPackages.${system}.alejandra;
      }
    );
}
