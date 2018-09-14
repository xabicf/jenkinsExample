FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

USER root

FROM microsoft/dotnet:2.1-sdk AS dotnet-build
WORKDIR /app
COPY ./piranha.core/ .
RUN dotnet restore -nowarn:msb3202,nu1503
RUN ls -la 
RUN dotnet publish -c Release -o /app

FROM base AS final
#RUN apt-get -y update && \
#    apt-get -y install apt-transport-https && \
#    apt-get -y install wget 
#    apt-get -y install gpg && \
#    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
#    mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ && \
#    wget -q https://packages.microsoft.com/config/debian/9/prod.list && \
#    mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
#    chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
#    chown root:root /etc/apt/sources.list.d/microsoft-prod.list && \
#    apt-get -y update && \
#    apt-get -y install dotnet-sdk-2.1
WORKDIR /app/
COPY --from=dotnet-build /app .
WORKDIR /app/examples/CoreWeb/
ENTRYPOINT ["dotnet", "../../CoreWeb.ddl"]
