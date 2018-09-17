FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base

WORKDIR /app

EXPOSE 80

 

USER root

 

FROM microsoft/dotnet:2.1-sdk AS dotnet-build

WORKDIR /app
RUN ls
COPY examples/CoreWeb .

WORKDIR /app/examples/CoreWeb

RUN dotnet restore -nowarn:msb3202,nu1503

RUN dotnet publish --no-restore -c Release -o /app

COPY examples/piranha.core/examples/CoreWeb/assets /app/assets

 

FROM base AS final

WORKDIR /app

COPY --from=dotnet-build /app .

ENTRYPOINT ["dotnet", "CoreWeb.dll"]
