
# Get the current stable Nixpkgs
nix flake show "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz"

# Get the current unstable Nixpkgs
nix flake show "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz"


        default = pkgs.mkShell {
          hardeningDisable = ["all"];
          packages = with pkgs; [ 
            nodejs 
            node2nix 
            yarn 
            nodePackages.pnpm 
            nodePackages.prettier
            nodePackages.prettierd
            nodePackages.eslint
            nodePackages.eslint_d
            nodePackages.serve
            nodePackages.typescript-language-server
            nodePackages.svelte-language-server
          ];
          shellHook = ''
            echo nix shell!
            echo "node `${pkgs.nodejs}/bin/node --version`"
            '';
        };
