FROM composer
ENTRYPOINT []

RUN composer global require hirak/prestissimo

RUN wget https://github.com/alexellis/faas/releases/download/0.6.5/fwatchdog -O /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

COPY commands/   .
RUN chmod +x *.sh

COPY composer.json   .
RUN cat composer.json | bash update.sh

ENV fprocess="composer about"

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1
CMD ["fwatchdog"]
