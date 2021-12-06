FROM mcr.microsoft.com/powershell
RUN mkdir /powershell
ENV ENV_WEBHOOK_URL=https://127.0.0.1
ENV ENV_MESSAGE=Test
COPY notify.ps1 /powershell/notify.ps1
CMD pwsh /powershell/notify.ps1 -WebhookURL ${ENV_WEBHOOK_URL} -Message ${ENV_MESSAGE}
