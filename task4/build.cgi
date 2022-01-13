#! /bin/bash

cd /home/buildsrv/build/project2

echo -e "Content-type: text/html\n"
echo -e "<html>\n\t<body>"

cd src
git pull
cd build

cmake .. > /dev/null

make > build.txt 2> errors.txt
make install

errs=$(cat errors.txt)
errs=${errs/$'\n'/<br>$'\n'}
blds=$(cat build.txt)
blds=${blds/$'\n'/<br>$'\n'}

echo -e "\n\t\t<br><b>Build output:</b><br>===========<br>\n${blds}\n<br>"
echo -e "\n\t\t<br><b>Build errors:</b><br>===========<br>\n${errs}\n<br>"
echo -e "\t</body>\n</html>"

