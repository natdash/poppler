{ mkDerivation, array, base, bytestring, Cabal, cairo, containers
, glib, gtk2hs-buildtools, gtk3, mtl, pango, poppler, stdenv
}:
mkDerivation {
  pname = "poppler";
  version = "0.14.3";
  src = ./.;
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal gtk2hs-buildtools ];
  libraryHaskellDepends = [
    array base bytestring cairo containers glib gtk3 mtl
  ];
  libraryPkgconfigDepends = [ pango ];
  libraryToolDepends = [ gtk2hs-buildtools ];
  homepage = "http://projects.haskell.org/gtk2hs";
  description = "Binding to the Poppler";
  license = stdenv.lib.licenses.gpl2;
}
