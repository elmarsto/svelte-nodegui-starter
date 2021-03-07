with import <nixpkgs> {};
let
  npmScript = pkgs.writeShellScriptBin "npm" ''
    ${pkgs.steam-run}/bin/steam-run ${pkgs.nodejs-14_x}/bin/npm $*
  '';
in
stdenv.mkDerivation rec {
  name = "svelte-nodegui";
  buildInputs = with pkgs; [
    git
    cmake
    steam-run
    npmScript
    nodejs-14_x
  ];
}

