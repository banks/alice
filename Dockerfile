FROM python:2

RUN pip install BitVector

RUN apt-get update && \
    apt-get install -y libunwind-dev gdb

ADD . /alice

ENV ALICE_HOME /alice
ENV PATH=$PATH:$ALICE_HOME/bin

RUN cd $ALICE_HOME/alice-strace && \
    ./configure; make; make install

RUN echo "set auto-load safe-path /" >> ~/.gdbinit

WORKDIR /app
