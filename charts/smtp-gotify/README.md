# smtp-gotify

[![MIT Licensed](https://img.shields.io/github/license/jreiml/smtp-gotify-helm)](https://github.com/jreiml/smtp-gotify-helm/blob/main/LICENSE)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/smtp-gotify)](https://artifacthub.io/packages/search?repo=smtp-gotify)
[![Quay.io](https://img.shields.io/badge/Docker-Quay.io-blue)](https://quay.io/repository/reiml/smtp-gotify)

## Overview

This is a Helm chart for deploying the `smtp-gotify` application, which listens for SMTP messages and forwards them to a Gotify server.

## Prerequisites

- [Gotify](https://github.com/gotify/server) (tested for 2.4.0+)
- Kubernetes (tested for 1.30+)
- Helm (tested for 3.15+)

## Add the Repository
Before installation the repository must be added.

```
helm repo add smtp-gotify https://jreiml.github.io/smtp-gotify-helm
```

## Installing the Chart

To install the chart with the release name `smtp-gotify`:

```bash
helm install smtp-gotify smtp-gotify/smtp-gotify --set gotify.url=<SERVER_URL> --set gotify.token=<APP_TOKEN1>,<APP_TOKEN2>
``` 

The command deploys `smtp-gotify` on the Kubernetes cluster in the default configuration. 
The configuration section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `smtp-gotify` deployment:

```bash
helm uninstall smtp-gotify
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `smtp-gotify` chart and their default values.

| Parameter          | Description                            | Default                       |
|--------------------|----------------------------------------|-------------------------------|
| `replicaCount`     | Number of replicas                     | `1`                           |
| `image.repository` | Image repository                       | `quay.io/reiml/smtp-gotify`   |
| `image.tag`        | Image tag                              | `latest`                      |
| `image.pullPolicy` | Image pull policy                      | `IfNotPresent`                |
| `service.type`     | Service type                           | `ClusterIP`                   |
| `service.port`     | Service port                           | `2525`                        |
| `gotify.url`       | Gotify server URL                      | `"<SERVER_URL>"`              |
| `gotify.token`     | Gotify API token                       | `"<APP_TOKEN1>,<APP_TOKEN2>"` |
| `resources`        | CPU/Memory resource requests/limits    | `{}`                          |
| `nodeSelector`     | Node labels for pod assignment         | `{}`                          |
| `tolerations`      | Toleration labels for pod assignment   | `{}`                          |
| `affinity`         | Affinity settings for pod assignment   | `{}`                          |


**Important**: The variable `gotify.url` should be in the form `http[s]://example.com[:port]/` (including trailing slash).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```bash
helm install smtp-gotify smtp-gotify/smtp-gotify --set gotify.url=https://your-gotify-server.com/ --set gotify.token=your-gotify-token
````

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. 
For example:

```bash
helm install smtp-gotify smtp-gotify/smtp-gotify -f values.yaml
```

## License

This project is licensed under the MIT License.
