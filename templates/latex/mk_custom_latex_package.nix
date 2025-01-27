# See https://nixos.org/manual/nixpkgs/stable/#sec-language-texlive-custom-packages
{ pkgs }:

{
  name,
  src ? "",
  srcs ? [],
  buildPhase ? "",
  unpackPhase ? "",
  nativeBuildInputs ? []
}:

if (src != "" && srcs != [])
|| (src == "" && srcs == []) then
  throw "Exactly one of 'src' or 'srcs' must be defined"
else
  pkgs.stdenv.mkDerivation {
    inherit name src srcs buildPhase;
    pname = name;
    outputs = [ "tex" "texdoc" ];
    nativeBuildInputs = nativeBuildInputs ++ [
      # multiple-outputs.sh fails if $out is not defined
      (pkgs.writeShellScript "force-tex-output.sh" ''
        out="''${tex-}"
      '')
    ];
    unpackPhase = unpackPhase + (if src != "" then ''
        cp "$src" $(stripHash "$src")
      '' else ''
        for "$_src" in "$srcs"; do
          cp "$_src" $(stripHash "$_src")
        done
      '');
    # TODO
    # If unpackPhase unpacks into a directory
    # installPhase will silently do nothing
    installPhase = ''
      path="$tex/tex/latex/${name}"
      mkdir -p "$path"
      for file in *.{cls,def,clo,sty}; do
        cp $file "$path/"
      done

      path="$texdoc/doc/tex/latex/${name}"
      mkdir -p "$path"
      for file in *.pdf; do
        cp $file "$path/"
      done
    '';
  }