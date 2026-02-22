final: prev:

{
  zen-browser =
    final.inputs.zen-browser.packages.${final.stdenv.hostPlatform.system}.default;
}
