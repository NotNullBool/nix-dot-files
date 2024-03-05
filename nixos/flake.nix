{
    description = "Nixos config flake";

    inputs = {

        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

        unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        sops-nix.url = "github:Mic92/sops-nix";

        nur.url = "github:nix-community/NUR";

        home-manager = {
            url = "github:nix-community/home-manager/release-23.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { self, nixpkgs, ... }@inputs:
    let
        system = "x86_64-linux";
        unstable-pkgs = import inputs.unstable-nixpkgs {
            inherit system;
            config = {allowUnfree=true;};
        };
        pkgs = import nixpkgs {
            inherit system;
            config = {allowUnfree=true;};
            overlays = [ inputs.nur.overlay ];
        };
    in
    {

        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {inherit inputs; inherit unstable-pkgs;};
            modules = [ 
                ./system/configuration.nix
                inputs.nur.nixosModules.nur
            ];
        };

        homeConfigurations."unix@nixos" = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = { inherit inputs; inherit unstable-pkgs;};
            modules = [
                ./user/home.nix
                inputs.nur.hmModules.nur
            ];
        };

        devShell.${system} = pkgs.mkShell {
            packages = with pkgs; [nil];
        };

    };
}
