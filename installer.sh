#! /bin/sh -

if [ "X-h" = "X$1" ];
then
  cat<<EOF;
usage: $0 h:
EOF
  exit 0;
fi

# Variables
repoUrl="https://github.com/AlbaroPereyra22/emacsconf";
fileName=${repoUrl##*/};
uname=$(uname -r)
WSL2=${uname##*-}

rm -rf ~/${fileName}
git clone $repoUrl ~/${fileName};
# Creates a directory if it does not exist
mkdir -p ~/.emacs.d;
touch ~/.emacs.d/.emacs-custom.el;
# TODO update based on uname
if [ "X$WSL2" = "XWSL2" ];
then
  mv ~/${fileName}/WSL2Init.el ~/.emacs.d/init.el;
elif [ "X$(uname -s)" = "XDarwin" ];
then
  mv ~/${fileName}/MacOSInit.el ~/.emacs.d/init.el;
fi
rm -rf ~/${fileName};
printf "Emacs conf has been updated.\n";
