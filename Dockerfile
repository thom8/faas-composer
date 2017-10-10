FROM composer
ENTRYPOINT []

RUN composer global require hirak/prestissimo

ADD https://github.com/alexellis/faas/releases/download/0.6.5/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

COPY entry.sh   .
RUN chmod +x entry.sh

COPY composer.json   .
RUN cat composer.json | bash entry.sh

ENV fprocess="bash ./entry.sh"

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1
CMD ["fwatchdog"]
