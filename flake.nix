{
  inputs = {
    mach-nix.url = "github:DavHau/mach-nix/3.3.0";
  };

  outputs = { self, nixpkgs, mach-nix }: {
    devShell.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      mach-nix-package = import mach-nix {
        inherit pkgs;
        python = "python39Full";
      };
      pyEnv = mach-nix-package.mkPython {
        requirements = ''
          black
          pylint
        '';
      };
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        git
        inotify-tools
        
        pyEnv

        elixir
        elixir_ls
        erlang
        
        protobuf
      ];
      shellHook = ''
        # this allows mix to work on the local directory
        mkdir -p .state/mix .state/hex
        export MIX_HOME=$PWD/.state/mix
        export HEX_HOME=$PWD/.state/hex
        export PATH=$MIX_HOME/bin:$MIX_HOME/escripts:$HEX_HOME/bin:$PATH
        # TODO: not sure how to make hex available without installing it afterwards.
        mix local.hex --if-missing --force
        export LANG=en_US.UTF-8
        export ERL_AFLAGS="-kernel shell_history enabled"

        export MIX_ENV=dev
      '';
    };
  };
}
