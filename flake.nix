{
  description = "Monorepo for Kodehode.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      # Helper functions for creating package sets.
      withSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      withPkgs =
        callback:
        withSystem (
          system:
          callback (
            import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            }
          )
        );
    in
    {
      # Development Environments
      devShells = withPkgs (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.terraform
            pkgs.dotnetCorePackages.sdk_9_0 # Program Development
          ];
        };
        
        # Development Environment Variables
        env = {
          # Required for VS Code extensions .NET
          DOTNET_ROOT = builtins.toString pkgs.dotnetCorePackages.sdk_9_0;
        };
      });

      formatter = withPkgs (pkgs: pkgs.nixfmt-rfc-style);
    };
}
