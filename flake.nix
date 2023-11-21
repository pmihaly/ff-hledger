{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        deps = with pkgs; [
          stack
          hledger
        ];
      in
      {
        devShell = nixpkgs.legacyPackages.${system}.mkShell {
          buildInputs = deps;
        };
      });
}
