{ jacobi ? import
    (fetchTarball {
      name = "jacobi-2022-11-15";
      url = "https://nix.cobi.dev/x/ce9a2f049cbd8c07cc0d7a9ee60a169d6fc7e0f2";
      sha256 = "1k30bwz3jfb2i0xx6w3vharbna8xbzg930a1gdcjgfj4j3dijvnp";
    })
    { }
}:
let
  name = "terraform-provider-pingdom";

  tools = with jacobi; {
    cli = [
      jq
      nixpkgs-fmt
    ];
    go = [
      go_1_19
      go-tools
      gopls
    ];
  };

  env = jacobi.enviro {
    inherit name tools;
  };
in
env
