FROM mcr.microsoft.com/dotnet/sdk:5.0


WORKDIR /app

COPY . .

RUN dotnet new webapi -n MinhaApi
