FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["backend/OfficeBites.Hosting.API/OfficeBites.Hosting.API.csproj", "backend/OfficeBites.Hosting.API/"]
RUN dotnet restore "backend/OfficeBites.Hosting.API/OfficeBites.Hosting.API.csproj"
COPY . .
WORKDIR "/src/backend/OfficeBites.Hosting.API"
RUN dotnet build "OfficeBites.Hosting.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "OfficeBites.Hosting.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "OfficeBites.Hosting.API.dll"]
