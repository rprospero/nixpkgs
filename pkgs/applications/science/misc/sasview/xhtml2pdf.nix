with import <nixpkgs> {};

let
  html5 = import ./myHtml5.nix;
in

python27.pkgs.buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "xhtml2pdf";
  version = "0.2.1";

  buildInputs = [html5];
  propagatedBuildInputs = with python27Packages; [httplib2 pillow pypdf2 reportlab html5];

  src = python27.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "1n9r8zdk9gc2x539fq60bhszmd421ipj8g78zmsn3njvma1az9k1";
  };
}
