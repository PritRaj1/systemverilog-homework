{
  description = "Dev shell for system-verilog-homework";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.git
          pkgs.bash
          pkgs.coreutils
          pkgs.findutils
          pkgs.gawk

          pkgs.verilog
          pkgs.verilator
          pkgs.yosys
          pkgs.gtkwave

          pkgs.jdk17_headless
          pkgs.glibcLocales
        ];

        LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
        LANG = "en_US.UTF-8";
        LC_ALL = "en_US.UTF-8";

        shellHook = ''
          export PATH="$PWD/bin:$PATH"
          alias rars="java -jar $PWD/bin/rars1_6.jar"
        '';
      };
    };
}
