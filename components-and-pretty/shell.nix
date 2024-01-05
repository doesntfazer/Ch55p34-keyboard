{
  pkgs ? import <nixpkgs> {},
  on-nixos ? true,
  interactive-html-bom ? pkgs.callPackage ../nix/pkgs/interactive-html-bom {},
  # Kludge: on NixOS desktop, need virtualgl for the pcbnew
  # to be able to show 3D preview.
  kibot ? pkgs.callPackage ../nix/pkgs/kibot {},
  pcbdraw ? pkgs.callPackage ../nix/pkgs/pcbdraw {},
  recordmydesktop ? pkgs.callPackage ../nix/pkgs/recordmydesktop {},
}:
pkgs.mkShell {
  # The environment variables KiBot uses for its
  # 3D preview are in ~/.config/kicad/kicad_common, for Kicad 5.
  # /nix/store/niapxda5vc2mpyys5bn07zs30jwd2qi7-kicad-symbols-7d4cbbddce/share/kicad/library
  KICAD_SYMBOL_DIR = "${pkgs.kicad.libraries.symbols}/share/kicad/library";
  # /nix/store/f4raka5s0z9cqwpqbw2954v774kiqb90-kicad-packages3d-be0ba9377b/share/kicad/modules/packages3d/
  KISYS3DMOD = "${pkgs.kicad.libraries.packages3d}/share/kicad/modules/packages3d";
  # /nix/store/p0j7z9ld18mqiipqlihyy691v3ma0qmr-kicad-footprints-e53d53ac4a/share/kicad/modules
  KISYSMOD = "${pkgs.kicad.libraries.footprints}/share/kicad/modules";

  # Couldn't get KiAuto's interposer to work.
  KIAUTO_INTERPOSER_DISABLE = "1";

  shellHook = ''
    KICAD_COMMON_CONFIG="$HOME/.config/kicad/kicad_common"
    if ! grep -q KISYS3DMOD "$KICAD_COMMON_CONFIG"; then
      echo "KISYS3DMOD=$KISYS3DMOD" >> "$KICAD_COMMON_CONFIG"
    fi
  '';

  LD_LIBRARY_PATH =
    if on-nixos
    then
      # c.f. https://nixos.wiki/wiki/OpenGL
      "/run/opengl-driver/lib:/run/opengl-driver-32/lib"
    else "";

  buildInputs = with pkgs; [
    fluxbox
    interactive-html-bom
    kibot
    pcbdraw
    recordmydesktop
    turbovnc
    virtualgl
    wmctrl
    x11vnc
    xclip
    xdotool
    xorg.xkbcomp
  ];
}
