#!/bin/bash

###B3 parser - Criado por Bruno Magnum Vasconcelos Monteiro Salazar

if [ "$1" == "" ]; then
  echo "Nenhum arquivo especificado!!"
  echo "Uso: b3_parser.sh <arquivo historico .txt>"
  exit 1
else

  ORIGINAL_FILE=$1
  FINAL_FILE="$1_parsed.csv"
  echo "Iniciando o tratamento do arquivo $ORIGINAL_FILE"

  echo "Criando o cabecalho no formate B3"
  echo "ID;TIPREG;DATAPREGAO;CODBDI;CODNEG;TPMERC;NOMRES;ESPECI;PRAZOT;MODREF;PREABE;PREMAX;PREMIN;PREMED;PREULT;PREOFC;PREOFV;TOTNEG;QUATOT;VOLTOT;PREEXE;INDOPC;DATVEN;FATCOT;PTOEXE;CODISI;DISMES" > $FINAL_FILE

  echo "Criando o arquivo em formato CSV"
  tail -n +2 $ORIGINAL_FILE | head -n -1 | cut -b 1-2,3-10,11-12,13-24,25-27,28-39,40-49,50-52,53-56,57-69,70-82,83-95,96-108,109-121,122-134,135-147,148-152,153-170,171-188,189-201,202,203-210,211-217,218-230,231-242,243-245 --output-delimiter=';' >> $FINAL_FILE

fi
