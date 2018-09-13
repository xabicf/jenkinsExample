FROM ubuntu:latest

RUN uname -a
RUN apt-get -y update && \
    apt-get -y install wget dpkg && \
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get -y install nano && \
    apt-get -y install tree && \
    apt-get -y install liblttng-ust0 && \
    apt-get -y install libcurl3 && \
    apt-get -y install libssl1.0.0 && \
    apt-get -y install libkrb5-3 && \
    apt-get -y install zlib1g && \
    apt-get -y install libicu60  && \
    apt-get -y install libunwind8 && \
    apt-get -y install libuuid1 && \
    apt-get -y update && \
    apt-get -y install apt-transport-https && \
    apt-get -y install dotnet-hosting-2.0.8 && \


COPY miProyecto .

CMD ["bash"]
