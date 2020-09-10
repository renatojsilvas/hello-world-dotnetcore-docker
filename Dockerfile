# Baixa o sdk do dotnetcore do docker hub da microsoft
FROM mcr.microsoft.com/dotnet/core/sdk:3.1

# Torna /app a pasta de trabalho atual
WORKDIR /app

# Copia o arquivo de projeto para a pasta /app
COPY *.csproj ./

# Restaura as dependências
RUN dotnet restore

# Copia todo o conteúdo para a pasta /app
COPY . ./

# Publica a aplicação no modo release na pasta Out
RUN dotnet publish -c Release -o Out

# Executa o comando dotnet Out/hello-world-dotnetcore-docker.dll 
ENTRYPOINT [ "dotnet", "Out/hello-world-dotnetcore-docker.dll" ]