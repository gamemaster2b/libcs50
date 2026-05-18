{
  stdenv,
  meson,
  ninja,
  pkg-config,
  lib,
  ...
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "libcs50";
  version = "11.1.0";

  outputs = [
    "out"
    "dev"
    "devman"
  ];

  src = ./.;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  postInstall = ''
    substituteInPlace $out/lib/cmake/libcs50/libcs50Targets.cmake \
      --replace-warn "\''${_IMPORT_PREFIX}/lib" "$out/lib" \
      --replace-warn "\''${_IMPORT_PREFIX}/$dev" "$dev"
  '';

  meta = with lib; {
    description = "This is CS50's Library for C.";
    homepage = "https://cs50.readthedocs.io/libraries/cs50/c/";
    changelog = "https://github.com/cs50/libcs50/releases";
    license = licenses.gpl3;
    sourceProvenance = [ sourceTypes.fromSource ];
    platforms =
      platforms.windows ++ platforms.unix ++ platforms.wasi ++ platforms.redox ++ platforms.genode;
  };
})
