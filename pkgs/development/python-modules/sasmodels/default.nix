{ lib, fetchFromGitHub, buildPythonPackage, pytest, numpy, scipy, matplotlib, docutils
, pyopencl, opencl-headers
}:

buildPythonPackage rec {
  pname = "sasmodels";
  version = "0.97";

  src = fetchFromGitHub {
    owner = "SasView";
    repo = "sasmodels";
    rev = "v0.97";
    sha256 = "1yd8lld2ycr9vcw2xvjkh6hy0w8fkxj1q17zirc5gmbgrv76vp1q";
  };

  buildInputs = [ opencl-headers ];
  checkInputs = [ pytest ];
  propagatedBuildInputs = [ docutils matplotlib numpy scipy pyopencl ];

  checkPhase = ''
    HOME=$(mktemp -d) py.test -c ./pytest.ini -k 'not romberg'
  '';

  meta = {
    description = "Library of small angle scattering models";
    homepage = http://sasview.org;
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ rprospero ];
  };
}
