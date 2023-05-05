# Comandos originales
FROM postgres
COPY words.sql /docker-entrypoint-initdb.d/words.sql
ENV POSTGRES_HOST_AUTH_METHOD=trust

# # Comandos aplicando multi stage

# No se ve necesario
