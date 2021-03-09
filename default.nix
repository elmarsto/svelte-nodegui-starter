with import <nixpkgs> {};
let
  unstable = import
    #(builtins.fetchTarball https://nixos.org/channels/nixos-unstable)
    #(builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/staging.tar.gz)
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/master.tar.gz)
    # reuse the current configuration
    { config = config; };

  npmScript = pkgs.writeShellScriptBin "Npm" ''
    ${unstable.steam-run}/bin/steam-run ${unstable.nodejs-15_x}/bin/npm $*
  '';
in
stdenv.mkDerivation rec {
  name = "svelte-nodegui";
  buildInputs = with pkgs; [
    unstable.gcc
    npmScript
    git
    unstable.cmake
    p7zip
    unstable.steam-run
    unstable.nodejs-15_x
  ];
}

