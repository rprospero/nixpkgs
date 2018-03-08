with import <nixpkgs> {};

python27.pkgs.buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "bumps";
  version = "0.7.6";

  propagatedBuildInputs = with python27Packages; [six];

  doCheck = false;

  src = python27.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "1ahzw8ls9wsz2ks668s15zskyykib52fhi07mg50hp7lw9avqb5k";
  };
}
