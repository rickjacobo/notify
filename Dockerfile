FROM mcr.microsoft.com/powershell:ubuntu-16.04

RUN curl -sSL https://github.com/openfaas/faas/releases/download/0.6.15/fwatchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog
WORKDIR /root/

COPY function function

ENV ENV_WEBHOOK_URL="http://127.0.0.1"
ENV fprocess="pwsh ./function/handler.ps1"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
