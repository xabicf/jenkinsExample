FROM ubuntu:latest

RUN apt-get update && \
    apt-get install nano && \
    apt-get install tree && \
    apt-get install dotnet



COPY miProyecto .

CMD ["bash"]
