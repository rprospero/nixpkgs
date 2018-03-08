with import <nixpkgs> {};

python27.pkgs.buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "unittest-xml-reporting";
  version = "2.1.1";

  propagatedBuildInputs = with python27Packages; [six];

  doCheck = false;

  src = python27.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "1jwkqx5gfphkymp3xwqvlb94ng22gpbqh36vbbnsrpk1a0mammm6";
  };
}
