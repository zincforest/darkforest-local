let pkgs = (import ./.nix/pinned-nixpkgs.nix {})."21_11"."2022_01_26";
in pkgs.mkShell {
  name = "darkforest-shell";

  buildInputs = with pkgs; [
    # the basics
    nodejs-16_x
    (yarn.override {
      nodejs = nodejs-16_x;
    })
    yarn2nix

    # utilities
    nodePackages.typescript-language-server
  ];
}
