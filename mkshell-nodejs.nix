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
