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




$(echo '<div class="card" style="margin: 0 auto; width: 50rem; background-color:#000080; color:#ffffff">' >> $historico)
$(echo '<div class="card-body">' >> $historico)
$(echo '<div class="card-row">' >> $historico)
$(echo '<div class="col-md-4">' >> $historico)
$(echo '<iframe src="https://giphy.com/embed/11ISwbgCxEzMyY" width="750" height="360" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>' >> $historico)
$(echo '    </div>' >> $historico)
$(echo '<div class="card-header">' >> $historico)
$(echo '<b>FICHA TÉCNICA</b>' >> $historico)
$(echo '    </div>' >> $historico)
$(echo '<ul class="list-group list-group-flush">' >> $historico)
$(echo '        <li class="list-group-item"><b>Data (ISO8601):</b> '$iso'</li> '>> $historico)
$(echo '        <li class="list-group-item"><b>Nome da máquina:</b> ' $hostname'</li> '>> $historico)
$(echo '        <li class="list-group-item"><b>Total de memória RAM usada:</b> ' $free'</li>'>> $historico)
$(echo '        <li class="list-group-item"><b>Total de memória RAM disponível:</b> ' $free_two'</li>' >> $historico)
$(echo '        <li class="list-group-item"><b>O nome do processo que utiliza mais memória e o total de memória RAM utilizada:</b> ' $ps'</li>' >> $historico)
$(echo '        <li class="list-group-item"><b>A listagem das partições contendo ponto de ponto de montagem, tamanho e percentagem de utilização:</b> ' $df'</li>' >> $historico)
$(echo '        <li class="list-group-item"><b>O total de bytes e pacotes enviados e recebidos em cada interface de rede:</b> ' $cat'</li>' >> $historico)
$(echo '    </ul>' >> $historico)
$(echo '    </div>' >> $historico)
$(echo '    </div>' >> $historico)
$(echo '    </div>' >> $historico)
$(echo '    </br>' >> $historico)
