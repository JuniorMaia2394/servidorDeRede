historico="historico.html"
historico_arquivo="historico_arquivo.txt" 


iso=$(date --iso-8601=s)
$(echo $iso >> $historico_arquivo)


hostname=$(hostname)
$(echo $hostname >> $historico_arquivo)


free=$(free -h | grep Mem | awk '{print $3}')
$(echo $free >> $historico_arquivo)

free_two=$(free -h | grep Mem | awk '{print $7}')
$(echo $free_two >> $historico_arquivo)


ps=$(ps -o pid,%mem,rss,comm ax | sort -b -k2 | tail -n 2 | awk 'FNR == 1 {printf "%s %s\n",$2,$4}')
$(echo $ps >> $historico_arquivo)


df=$(df -h | grep -v 'loop' | awk 'NR>1 {printf "%s %s %s\n",$2, $5x, $6}')
$(echo $df >> $historico_arquivo)


cat=$(cat /proc/net/dev | awk 'NR>2 {printf "%s %s %s %s %s\n",$1, $2, $3, $10, $11}')
$(echo $cat >> $historico_arquivo)




$(echo '<div>' >> $historico)
$(echo "        <p>Data (ISO8601): $iso</p>" >> $historico)
$(echo "        <p>Nome da máquina: $hostname</p>" >> $historico)
$(echo "        <p>Total de memória RAM usada: $free</p>" >> $historico)
$(echo "        <p>Total de memória RAM disponível: $free_two</p>" >> $historico)
$(echo "        <p>O nome do processo que utiliza mais memória e o total de memória RAM utilizada: $ps</p>" >> $historico)
$(echo "        <p>A listagem das partições contendo ponto de ponto de montagem, tamanho e percentagem de utilização: $df</p>" >> $historico)
$(echo "        <p>O total de bytes e pacotes enviados e recebidos em cada interface de rede: $cat</p>" >> $historico)
$(echo '    </div>' >> $historico)
$(echo '<p>-----------------------------------</p>' >> $historico)