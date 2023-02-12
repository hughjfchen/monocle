# Note: [Nix Flake Usage]:
#
# The flake location can be defined as:
#   `github:change-metrics/monocle`, or `path:/absolute/path`, or `.`
#
# Package output can be accessed using their #name:
#   nix show-derivation '.#containerMonocle'
#
# For non packages, the full qualified name can be used:
#   nix show derivation '.#devShells."x86_64-linux".ci'
#
# Inspect context using nix-tree, for example:
#   nix run github:utdemir/nix-tree -- --derivation .#devShell."x86_64-linux"
{
  description = "Monocle";
  nixConfig.bash-prompt = "[nix(monocle)] ";

  nixConfig = {
    extra-substituters = "https://change-metrics.cachix.org";
    extra-trusted-public-keys =
      "change-metrics.cachix.org-1:dCe8jx9vptiF6DCdZ5y2QouvDsxgFRZnbHowhPnS4C0=";
  };

  inputs = {
    nixpkgs.url =
      "github:NixOS/nixpkgs/ed014c27f4d0ca772fb57d3b8985b772b0503bbd";
    hspkgs.url =
      "github:podenv/hspkgs/4a25962c7beede6cfcacc66000ef783e5c98e483";
    # "path:/srv/github.com/podenv/hspkgs";
  };

  outputs = { self, nixpkgs, hspkgs }:
    let
      legacy = import ./nix/default.nix {
        nixpkgsPath = nixpkgs;
        hspkgs = hspkgs.pkgs;
        self = self;
      };
    in {
      devShell."x86_64-linux" = legacy.shell;
      devShells."x86_64-linux".ci = legacy.ci-shell;
      devShells."x86_64-linux".monitoring = legacy.monitoring-shell;
      packages."x86_64-linux".default = legacy.monocle-exe;
      packages."x86_64-linux".env = legacy.monocle-light.env;
      packages."x86_64-linux".containerMonocle = legacy.containerMonocle;
      packages."x86_64-linux".containerGrafana = legacy.containerGrafana;
      packages."x86_64-linux".containerPrometheus = legacy.containerPrometheus;
      apps."x86_64-linux".default = {
        type = "app";
        program = "${legacy.monocle-exe}/bin/monocle";
      };
    };
}
