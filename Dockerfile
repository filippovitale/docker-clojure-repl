FROM filippovitale/java7
MAINTAINER Filippo Vitale @filippovitale

RUN apt-get -qy install curl
RUN curl https://raw.github.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein
RUN chmod +x /usr/local/bin/lein

ENV LEIN_ROOT 1
RUN lein upgrade

ADD repl151 /repl151
RUN cd /repl151 && echo "(exit)" | lein repl

WORKDIR /repl151
CMD lein repl
