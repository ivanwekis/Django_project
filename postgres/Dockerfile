# Usa la imagen oficial de PostgreSQL como base
FROM postgres:latest

# Variables de entorno para configurar la base de datos
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=TestDB

LABEL name=my-postgres-image
LABEL version=1.0

# Expone el puerto 5432
EXPOSE 5432
