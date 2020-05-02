{ pkgs ? <nixpkgs>, useGtk3 ? true }:
let
  haskellPackages = pkgs.haskellPackages;
  flags = if useGtk3 then ["-f gtk3"] else ["-f -gtk3"];
  expr = if useGtk3 then ./poppler-gtk3.nix else ./poppler-gtk2.nix;
  pkg = pkgs.haskell.lib.appendConfigureFlags (haskellPackages.callPackage expr {}) flags;
  buildInputs = (if useGtk3 then [ haskellPackages.gtk3 pkgs.gtk3 ] else [ haskellPackages.gtk pkgs.gtk2 ]) ++ [ pkgs.poppler ];
in pkg.overrideAttrs(attrs: {
  buildInputs = attrs.buildInputs ++ buildInputs;
})
