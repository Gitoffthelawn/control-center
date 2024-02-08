{
	description = "your dev environment";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, flake-utils }:
		flake-utils.lib.eachDefaultSystem (system:
			let
				pkgs = import nixpkgs { inherit system; };
			in
			{
				devShells.default = pkgs.mkShell {
					# hardeningDisable = [ "all" ];

					buildInputs = with pkgs; [
						# cli tools
						go-task
						zip
						jq

						# source version control
						git
						pre-commit

						# programming tools
						# nodejs-slim_21
						nodejs_20
						nodePackages.pnpm
						nodePackages.npm

						# build tools
					];

					shellHook = ''
						echo "using nix flake"
					'';
				};
			}
		);
}


