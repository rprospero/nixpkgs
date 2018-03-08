with import <nixpkgs> {};

python27.pkgs.buildPythonPackage rec {
  name = "sasmodels-${version}";
  version = "0.96";

  propagatedBuildInputs = with python27Packages; [pytest numpy scipy];

  doCheck = false;

  src = fetchgit {
    url = "https://github.com/SasView/sasmodels.git";
    rev = "v${version}";
    sha256 = "11qaaqdc23qzb75zs48fkypksmcb332vl0pkjqr5bijxxymgm7nw";
  };
}
