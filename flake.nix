{
  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        git
        inotify-tools

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
