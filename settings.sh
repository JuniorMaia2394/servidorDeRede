local=$(pwd)
crontab -l > temp
echo "*/2 * * * * /bin/bash $local/cuzcuz.sh >> $local/outFile.log 2>&1" > temp
echo " inicializando....."
crontab temp 
echo "Operação realizada com sucesso!"
rm temp
echo "Arquivo removido!"