#!/bin/bash
cd "$(dirname "$0")"
local=$(pwd)
source $local/gerar_historico_arquivo.sh
source $local/gerar_html.sh
source $local/settings.sh