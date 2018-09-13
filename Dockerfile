FROM ubuntu:latest

RUN uname -a
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get -y update && \
    apt-get -y install nano && \
    apt-get -y install tree && \
    apt-get -y installliblttng-ust0
    apt-get -y libcurl3 && \
    apt-get -y libssl1.0.0 && \
    apt-get -y libkrb5-3 && \
    apt-get -y zlib1g && \
    apt-get -y libicu60  && \
    apt-get -y install libunwind8 && \
    apt-get -y install libuuid1 && \
    apt-get -y install dotnet && \
    apt-get -y install apt-transport-https && \
    apt-get -y install dotnet-hosting-2.0.8 && \


COPY miProyecto .

CMD ["bash"]
