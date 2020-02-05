{ mkDerivation, array, base, bytestring, Cabal, cairo, containers
, gdk_pixbuf, glib, gtk, gtk2, gtk2hs-buildtools, mtl, pango
, stdenv
}:
mkDerivation {
  pname = "poppler";
  version = "0.14.3";
  src = ./.;
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal gtk2hs-buildtools ];
  libraryHaskellDepends = [
    array base bytestring cairo containers glib gtk mtl
  ];
  libraryPkgconfigDepends = [ gdk_pixbuf gtk2 pango ];
  libraryToolDepends = [ gtk2hs-buildtools ];
  homepage = "http://projects.haskell.org/gtk2hs";
  description = "Binding to the Poppler";
  license = stdenv.lib.licenses.gpl2;
}
