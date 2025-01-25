{
  description = "Nix Flakes LaTeX Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    externals = [
      # Provide external packages here in the format { name, url }
      # then usepackage them manually from ./packages in LaTeX file.
    ];

    # TODO make ./install-external.sh a derivation?
    makeBashLine = { name, url }: "./install-external.sh ${url} ${name}\n";
    shellHook = builtins.foldl' (x: y: x + y) "" (map makeBashLine externals);
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [ wget ];
      packages = with pkgs; [
        (texliveBasic.withPackages (ps: with ps; [
          # cm-super # Fixes "font not found" errors
        ]))
      ];
      shellHook = shellHook + ''
        echo "Entering LaTeX development shell..."
      '';
    };
  };
}
