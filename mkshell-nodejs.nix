
# Get the current stable Nixpkgs
nix flake show "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz"

# Get the current unstable Nixpkgs
nix flake show "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz"


        default = pkgs.mkShell {
          hardeningDisable = ["all"];
          packages = with pkgs; [
            nodejs
            yarn
            typescript
            prettierd
            tailwindcss-language-server
            nodePackages.pnpm
            nodePackages.eslint_d
            nodePackages.serve
            nodePackages.typescript-language-server
          ];
          shellHook = ''
            echo nix shell!
            echo "node `${pkgs.nodejs}/bin/node --version`"
            '';
        };
