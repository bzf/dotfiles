{ pkgs ? import <nixpkgs> { }
, lib ? pkgs.lib
, fetchFromGitHub ? pkgs.fetchFromGitHub
, stdenv ? pkgs.stdenv
}:

stdenv.mkDerivation rec {
  pname = "ruby-build";
  version = "20220426";

  src = fetchFromGitHub {
    owner = "rbenv";
    repo = "ruby-build";
    rev = "v${version}";
    sha256 = "sha256-pY+Y2emC9fQBVChKG2SRNKOHORTEbd9IH8EUdHXu0+0=";
  };

  postPatch = "patchShebangs bin/*";
  installPhase = "PREFIX=$out ./install.sh";

  meta = with lib; {
    description = " Compile and install Ruby";
    homepage = "https://github.com/rbenv/ruby-build";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
