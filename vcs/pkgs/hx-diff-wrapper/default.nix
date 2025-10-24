{ pkgs }:

pkgs.rustPlatform.buildRustPackage {
  pname = "hx-diff";
  version = "0.1.0";
  src = pkgs.lib.cleanSource ../../hx-diff;
  
  cargoLock = {
    lockFile = ../../hx-diff/Cargo.lock;
  };
}