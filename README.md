# SMTP to Gotify - Helm Charts

[![MIT Licensed](https://img.shields.io/github/license/jreiml/smtp-gotify-helm)](https://github.com/jreiml/smtp-gotify-helm/blob/main/LICENSE)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/smtp-gotify)](https://artifacthub.io/packages/search?repo=smtp-gotify)
[![Quay.io](https://img.shields.io/badge/Docker-Quay.io-blue)](https://quay.io/repository/reiml/smtp-gotify)

[smtp-gotify](https://github.com/jreiml/smtp-gotify) is a small program which listens for SMTP and sends all incoming Email messages to your Gotify server.

Say you have a software which can send Email notifications via SMTP.
You may use `smtp-gotify` as an SMTP server so
the notification mail can be sent to a Gotify app.

## Description

This [Helm](https://helm.sh/docs/) chart is used to deploy `smtp-gotify` with a stable configuration to Kubernetes clusters.

The upstream repository for the `smtp-gotify` project can be found [here](https://github.com/jreiml/smtp-gotify).

## Prerequisites

- [Gotify](https://github.com/gotify/server) (tested for 2.4.0+)
- Kubernetes (tested for 1.30+)
- Helm (tested for 3.15+)

## Usage

To add the repository run:

```bash
helm repo add smtp-gotify https://jreiml.github.io/smtp-gotify-helm
```

To deploy the chart with the release name `smtp-gotify` run:

```bash
# The variable `URL` should be in the form `http[s]://example.com[:port]`.
export URL=https://gotify.example.com/
export TOKEN=...
helm install smtp-gotify smtp-gotify/smtp-gotify \
  --set "gotify.url=$URL" \
  --set "gotify.token=$TOKEN"
```
