{
  pkgs,
  lib,
  ...
}:
pkgs.stdenv.mkDerivation rec {
  pname = "qemu-bpmp";
  version = "7.2.91"; # Replace with the desired version

  src = ./.; # Use the current directory as the source

  buildInputs = []; # Add any dependencies here if needed

  configurePhase = ''
    mkdir build
    cd build
    ../configure
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';

  meta = {
    description = "Qemu-bpmp is a modified qemu that can be used to emulate the BPMP firmware on the Jetson Agx/Nx";
  };
}
