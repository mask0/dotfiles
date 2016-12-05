#make directory and naming today
echo -n "\033[1;35mWhat day folder do you make? :\033[0;39m"
read ManthDate
Year=2016
FolderName=$Year$ManthDate

mkdir -p  $FolderName

#copy necessary file
cp resume.tex $FolderName/resume.tex

#change mode necessary file
chmod 777 $FolderName/resume.tex

#mkae pdf
echo ""
echo -n "\033[1;32mmake pdf file\033[0;39m"
echo ""

cd $FolderName
platex resume.tex
dvipdfmx resume.dvi
echo -n "\033[1;36mcompleted make pdf file\033[0;39m"
echo ""
echo ""

#remove unneecessary file
echo -n "\033[1;32mremove unneecessary files\033[0;39m"
echo ""
echo "rm -rf *.aux *.dvi *.log"
rm -rf *.aux *.dvi *.log

echo "\033[1;36mcompleted\033[0;39m"
