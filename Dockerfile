FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source
COPY ConversaoPeso.Web/*.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c realease -o . --no-restore

FROM build AS final
WORKDIR /source
COPY --from=build /source .
ENTRYPOINT ["dotnet", "ConversaoPeso.Web.dll"]