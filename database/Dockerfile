## Dockerfile for Azure SQL
FROM mcr.microsoft.com/azure-sql-edge:latest

## ARGS
ARG ACCEPT_EULA
ARG MSSQL_PID
ARG MSSQL_USER
ARG MSSQL_SA_PASSWORD
ARG MSSQL_DATABASE
ARG MSSQL_SERVER_HOST
ARG MSSQL_SERVER_PORT

## Set the environment variables
ENV ACCEPT_EULA=${ACCEPT_EULA}
ENV MSSQL_PID=${MSSQL_PID}
ENV MSSQL_USER=${MSSQL_USER}
ENV MSSQL_SA_PASSWORD=${MSSQL_SA_PASSWORD}
ENV MSSQL_DATABASE=${MSSQL_DATABASE}
ENV MSSQL_SERVER_HOST=${MSSQL_SERVER_HOST}
ENV MSSQL_SERVER_PORT=${MSSQL_SERVER_PORT}

## Set the working directory
WORKDIR /usr/src/app/database/azure-sql-edge

## Start the SQL Server and run the schema.sql file
CMD /opt/mssql/bin/sqlservr

## Expose the port
EXPOSE 1433