log_analyzerIP.sh

Herramienta rápida de análisis de logs y forensia básica para identificar:

IPs más activas en el log

IPs internas y externas sospechosas

Patrones de ataque más comunes

Puertos más accedidos

Ideal para analizar archivos de log de gran tamaño en entornos Linux de forma rápida y sin depender de herramientas pesadas.

🚀 Características

✅ Identificación de las 10 IPs más activas
✅ Detección de IPs internas (10.x.x.x, 172.16–31.x.x, 192.168.x.x, 127.0.0.1)
✅ Listado de las primeras 10 IPs externas para investigar posibles atacantes
✅ Conteo de ocurrencias de palabras clave sospechosas: failed, denied, invalid, error, attack, scan, unauthorized, forbidden
✅ Top 10 puertos más accedidos en el log
✅ Compatible con cualquier archivo de texto plan

### Intalacion :

git clone https://github.com/carlosrpastrana/Buscador-de-IP-para-log.git

cd log_analyzerIP

chmod +x log_analyzerIP.sh

### Uso :

Ejecuta el script indicando el archivo de log que quieres analizar:

ejemplo: ./log_analyzerIP.sh access.log

🔍 Casos de uso

Analizar logs de Apache/Nginx para detectar IPs maliciosas

Revisar intentos de acceso fallidos en SSH o FTP

Identificar si un ataque proviene de red interna o externa

Filtrar rápidamente información clave en archivos de log muy grandes

📄 Requisitos

Bash (probado en versiones 4.x y 5.x)

Comandos GNU: grep, sort, uniq, wc, du

📜 Licencia

Este proyecto está bajo la licencia MIT – puedes usarlo, modificarlo y distribuirlo libremente.

