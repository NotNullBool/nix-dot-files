{ stdenv, fetchgit}:

let
    # Would be better if I can find a way to pass a relative path to dotfiles
    themeConf = /home/unix/.dotfiles/sddm/theme.conf;
in
stdenv.mkDerivation {
    name = "sddm-theme";

    src = fetchgit{
        url= "https://framagit.org/MarianArlt/sddm-sugar-candy";
        rev= "2b72ef6c6f720fe0ffde5ea5c7c48152e02f6c4f";
        sha256= "1db4p2d0k5a6avr7dg9h1r7y9mx711ci5dgwmljqjb8pq5b0a22y";
        # hash= "sha256-XggFVsEXLYklrfy1ElkIp9fkTw4wvXbyVkaVCZq4ZLU=";
    };

    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
        cd $out/
        rm theme.conf
        cp -r ${themeConf} $out/theme.conf
    '';

        # cat "${themeConf}" > theme.conf
}
