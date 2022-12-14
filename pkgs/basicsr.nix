{ buildPythonPackage
, fetchPypi
, addict
, future
, lmdb
, numpy
, opencv4
, pillow
, pyyaml
, requests
, scikitimage
, scipy
, pytorch
, tensorboard
, torchvision
, tqdm
, yapf
, cython
, pytest
, ...
}:
buildPythonPackage rec {
  pname = "basicsr";
  version = "1.4.2";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uJtZWofvlkzamRO02ZOA3bZVTJZVd8DBDLe3jjEwHoc=";
  };
  nativeBuildInputs = [ cython ];
  checkInputs = [ pytest ];
  propagatedBuildInputs = [
    addict
    future
    lmdb
    numpy
    opencv4
    pillow
    pyyaml
    requests
    scikitimage
    scipy
    tensorboard
    pytorch
    torchvision
    tqdm
    yapf
  ];
  pythonImportsCheck = [ "basicsr" ];
  doCheck = false;
  postPatch = ''
    substituteInPlace requirements.txt --replace "tb-nightly" "tensorboard" --replace "opencv-python" "opencv"
  '';
}
