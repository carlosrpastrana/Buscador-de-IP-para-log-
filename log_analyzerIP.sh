#!/bin/bash
# log_analyzerIP.sh - Herramienta rápida de análisis de logs y forensia
# Autor: carlosrpastrana - Basado en aporte de asistente de Kali Linux

if [ $# -eq 0 ]; then
    echo "Uso: $0 <archivo.log>"
    echo "Ejemplo: $0 access.log"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: El archivo '$1' no existe."
    exit 1
fi

echo "=== ANALIZADOR DE LOGS ==="
echo "Archivo: $1"
echo "Tamaño: $(du -h $1 | cut -f1)"
echo "Líneas: $(wc -l $1 | cut -d' ' -f1)"
echo "=========================================="

echo -e "\n TOP 10 IPs MÁS ACTIVAS:"
grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" "$1" | sort | uniq -c | sort -nr | head -10

echo -e "\n IPs INTERNAS IDENTIFICADAS:"
grep -E -o "(10\.|172\.1[6-9]\.|172\.2[0-9]\.|172\.3[0-1]\.|192\.168\.|127\.0\.0\.1)" "$1" | sort -u

echo -e "\n IPs EXTERNAS SOSPECHOSAS:"
grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" "$1" | grep -vE "(10\.|172\.1[6-9]\.|172\.2[0-9]\.|172\.3[0-1]\.|192\.168\.|127\.0\.0\.1)" | sort -u | head -10

echo -e "\n POSIBLES PATRONES DE ATAQUE:"
patterns=("failed" "denied" "invalid" "error" "attack" "scan" "unauthorized" "forbidden")
for pattern in "${patterns[@]}"; do
    count=$(grep -i -c "$pattern" "$1")
    echo "- $pattern: $count ocurrencias"
done

echo -e "\n PUERTOS MÁS ACCEDIDOS:"
grep -E -o "(:[0-9]{1,5})" "$1" | sort | uniq -c | sort -nr | head -10

echo -e "\n=========================================="
echo " Análisis completado. Revisar IPs internas para ataques internos."
