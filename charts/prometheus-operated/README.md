# Prometheus Operated Chart

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.42.0](https://img.shields.io/badge/AppVersion-2.42.0-informational?style=flat-square)

## Description

A Helm chart that deploys a Prometheus instance using the prometheus operator

## Prerequisites

## Requirements

Kubernetes: `>=1.22.0-0`

## Get Helm Repository Info

```console
helm repo add arldka https://arldka.github.io/helm-charts
helm repo update
```

_See [`helm repo`](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Helm Chart

```console
helm install [RELEASE_NAME] arldka/prometheus-operated
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] arldka/prometheus-operated
```

With Helm v3, CRDs created by this chart are not updated by default and should be manually updated.
Consult also the [Helm Documentation on CRDs](https://helm.sh/docs/chart_best_practices/custom_resource_definitions).

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

### Upgrading an existing Release to a new major version

A major chart version change (like v1.2.3 -> v2.0.0) indicates that there is an incompatible breaking change needing manual actions.

### Limitations

Because the operator can only run as a single pod, there is potential for this component failure to cause rule deployment failure. Because this risk is outweighed by the benefit of having validation, the feature is enabled by default.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalScrapeConfigs | list | `[]` |  |
| enableAdminAPI | bool | `false` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| instanceName | string | `""` |  |
| nodeSelector | object | `{}` |  |
| paused | bool | `false` |  |
| resources | object | `{}` |  |
| retention | string | `"7d"` |  |
| securityContext.fsGroup | int | `65534` |  |
| securityContext.runAsGroup | int | `65534` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| service.annotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| storageCapacity | string | `"30Gi"` |  |
| storageClassName | string | `""` |  |
| version | string | `"v2.42.0"` |  |