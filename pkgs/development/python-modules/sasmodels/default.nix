{fetchgit, licenses, buildPythonPackage, pytest, numpy, scipy}:

buildPythonPackage rec {
  name = "sasmodels-${version}";
  version = "0.96";

  propagatedBuildInputs = [pytest numpy scipy];

  doCheck = false;

  src = fetchgit {
    url = "https://github.com/SasView/sasmodels.git";
    rev = "v${version}";
    sha256 = "11qaaqdc23qzb75zs48fkypksmcb332vl0pkjqr5bijxxymgm7nw";
  };

  meta = {
    description = "Library of small angle scattering models";
    homepage = http://sasview.org;
    license = licenses.bsd3;
  };
}
