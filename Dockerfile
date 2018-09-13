FROM ubuntu:latest

RUN apt-get update && \
    apt-get install nano && \
    apt-get install tree

CMD ["bash"]
