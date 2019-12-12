FROM ubuntu:cosmic

RUN apt-get update && apt-get install -y make bzip2 wget libuv1-dev gcc libssl-dev
RUN wget 'http://prdownloads.sourceforge.net/sbcl/sbcl-1.5.9-x86-64-linux-binary.tar.bz2' -O /tmp/sbcl.tar.bz2 && \
        mkdir /tmp/sbcl && \
        tar jxvf /tmp/sbcl.tar.bz2 --strip-components=1 -C /tmp/sbcl && \
        cd /tmp/sbcl && \
        sh install.sh && \
        cd /tmp \
        rm -rf /tmp/sbcl

RUN cd /tmp && \
        wget https://beta.quicklisp.org/quicklisp.lisp && \
        sbcl --load quicklisp.lisp --quit --eval '(quicklisp-quickstart:install)'
COPY sbclrc /root/.sbclrc
RUN mkdir -p /root/quicklisp/local-projects/webapp
WORKDIR /root/quicklisp/local-projects/webapp
COPY ./webapp.asd ./webapp.asd
COPY ./src ./src
COPY ./tests ./tests
COPY ./test.lisp ./test.lisp
COPY ./load.lisp ./load.lisp
RUN sbcl --load ./test.lisp --quit --disable-debugger --disable-ldb
RUN sbcl --load ./load.lisp --disable-debugger --disable-ldb --lose-on-corruption

ENTRYPOINT ["./app"]
