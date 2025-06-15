{
  description = "A very basic white hat flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ...} @ inputs: {
    nixosConfigurations."USER" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
    };

    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      packages = with nixpkgs.legacyPackages.x86_64-linux; [
        sherlock
        john
        rockyou
        sqlmap
        wordlists
        hashcat
        thc-hydra
        nmap
        wpscan
        aircrack-ng
        metasploit
        maltego
        audiness
        apk-tools
        snort
      ];
    };
  };
}