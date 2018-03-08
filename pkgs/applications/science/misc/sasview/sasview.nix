with import <nixpkgs> {};

let
  sasmodels = import ./sasmodels.nix;
  bumps = import ./bumps.nix;
  periodictable = import ./periodictable.nix;
  unittest-xml-reporting = import ./unittest-xml-reporting.nix;
  xhtml2pdf = import ./xhtml2pdf.nix;
  html5 = import ./myHtml5.nix;
in

python27.pkgs.buildPythonApplication rec {
  name = "sasview-${version}";
  version = "4.1.2";

  propagatedBuildInputs = with python27Packages; [
    bumps
    gcc
    h5py
    html5
    libxslt
    lxml
    matplotlib
    numpy
    pyparsing
    periodictable
    pillow
    pylint
    pyopencl
    pytest
    reportlab
    sasmodels
    scipy
    six
    sphinx
    unittest-xml-reporting
    wxPython
    xhtml2pdf];

  doCheck = false;

  src = fetchgit {
    url = "https://github.com/SasView/sasview.git";
    rev = "v${version}";
    sha256 ="05la54wwzzlkhmj8vkr0bvzagyib6z6mgwqbddzjs5y1wd48vpcx";
  };

  patches = [./pyparsing-fix.patch ./local_config.patch];
  sandbox = true;
}
