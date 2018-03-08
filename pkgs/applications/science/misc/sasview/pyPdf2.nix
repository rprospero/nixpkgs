with import <nixpkgs> {};

python27.pkgs.buildPythonPackage rec {
  pname = "pyPdf";
  version = "1.13";

  propagatedBuildInputs = with python27Packages; [];

  src = python27.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "0fqfvamir7k41w84c73rghzkiv891gdr17q5iz4hgbf6r71y9v9s";
  };
}
