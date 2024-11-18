
# Get the current stable Nixpkgs
nix flake show "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz"

# Get the current unstable Nixpkgs
nix flake show "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz"


        default = pkgs.mkShell {
          venvDir = ".venv";
          packages = with pkgs; [ 
            python311
          ] ++
            (with pkgs.python311Packages; [
              pip
              venvShellHook
              pyperclip
            ]);
        };
