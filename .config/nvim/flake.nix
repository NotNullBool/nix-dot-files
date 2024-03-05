{
    description = "Lua dev shell";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs }: 
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {inherit system;};
    in
    {

        devShell.${system} = pkgs.mkShell {
            packages = with pkgs = [
                lua-lsp-server
            ];
        };

    };
}