with import <nixpkgs> {};

python27.pkgs.buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "periodictable";
  version = "1.5.0";

  propagatedBuildInputs = with python27Packages; [numpy pyparsing];

  src = python27.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "1cjk6aqcz41nxm4fpriz01vqdafd6g57cjk0wh1iklk5cx6c085h";
  };
}
