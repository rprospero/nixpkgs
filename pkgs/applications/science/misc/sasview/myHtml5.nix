with import <nixpkgs> {};

python27.pkgs.buildPythonPackage (rec{
  buildInputs = with python27.pkgs; [ flake8 pytest pytest-expect mock ];
  propagatedBuildInputs = with python27.pkgs; [
    six webencodings
  ];

  checkPhase = ''
    py.test
  '';
  pname = "html5lib";
  name = "html5lib-${version}";
  version = "1.0b10";
  src = python27.pkgs.fetchPypi {
    pname = "html5lib";
    inherit version;
    sha256 = "1yd068a5c00wd0ajq0hqimv7fd82lhrw0w3s01vbhy9bbd6xapqd";
  };
})
