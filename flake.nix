{
  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ nixpkgs, ... }:
    let
      inherit (builtins) listToAttrs map;
      inherit (nixpkgs.lib) nixosSystem;

      hostNames = [ "server" ];
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      nixosConfigurations = listToAttrs (map (hostName: { name = hostName; value = nixosSystem ((import nixos/${hostName}.nix) inputs); }) hostNames);
    };
}
