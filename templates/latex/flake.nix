{
  description = "Nix Flakes LaTeX Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    mkCustomLatexPackage = import ./mk_custom_latex_package.nix { inherit pkgs; };
    customPackages = [
      /*
      (mkCustomLatexPackage {
        name = ...;
        src = ...;
        OR
        srcs = [ ... ]
      })
      */
    ];
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        (texliveBasic.withPackages (ps: with ps; [
          # cm-super # Fixes "font not found" errors
        ] ++ customPackages))
      ];
      shellHook = ''
        echo "Entering LaTeX development shell..."
      '';
    };
  };
}
