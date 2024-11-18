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
