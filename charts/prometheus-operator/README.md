# Prometheus Operator Chart

![Version: 12.0.0](https://img.shields.io/badge/Version-12.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.72.0](https://img.shields.io/badge/AppVersion-0.72.0-informational?style=flat-square)

## Description

Stripped down version of prometheus-operator to only provision the operator and nothing else based on the kube-prometheus-stack chart.

## Prerequisites

## Requirements

Kubernetes: `>=1.19.0-0`

## Get Helm Repository Info

```console
helm repo add arldka https://arldka.github.io/helm-charts
helm repo update
```

_See [`helm repo`](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Helm Chart

```console
helm install [RELEASE_NAME] arldka/prometheus-operator
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Helm Chart

```console
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

CRDs created by this chart are not removed by default and should be manually cleaned up:

```console
kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] arldka/prometheus-operator
```

With Helm v3, CRDs created by this chart are not updated by default and should be manually updated.
Consult also the [Helm Documentation on CRDs](https://helm.sh/docs/chart_best_practices/custom_resource_definitions).

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

### Upgrading an existing Release to a new major version

:warning: The ScrapeConfigs objects are supported from version 8.0.0 onwards.

A major chart version change (like v1.2.3 -> v2.0.0) indicates that there is an incompatible breaking change needing manual actions.

### From 11.x to 12.x

This version upgrades Prometheus-Operator to v0.72.0.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusagents.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.72.0/example/prometheus-operator-crd-full/monitoring.coreos.com_scrapeconfigs.yaml
```

### From 10.x to 11.x

This version upgrades Prometheus-Operator to v0.71.2.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusagents.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.71.2/example/prometheus-operator-crd-full/monitoring.coreos.com_scrapeconfigs.yaml
```

### From 9.x to 10.x

This version upgrades Prometheus-Operator to v0.70.0.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusagents.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.70.0/example/prometheus-operator-crd-full/monitoring.coreos.com_scrapeconfigs.yaml
```

### From 8.x to 9.x

This version upgrades Prometheus-Operator to v0.69.0.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusagents.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.69.0/example/prometheus-operator-crd-full/monitoring.coreos.com_scrapeconfigs.yaml
```

### From 7.x to 8.x

This version upgrades Prometheus-Operator to v0.67.0.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusagents.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.67.0/example/prometheus-operator-crd-full/monitoring.coreos.com_scrapeconfigs.yaml
```

### From 6.x to 7.x

This version upgrades Prometheus-Operator to v0.66.0.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusagents.yaml
```

### From 5.x to 6.x

This version upgrades Prometheus-Operator to v0.65.1.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.65.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusagents.yaml
```

### From 4.x to 5.x

This version upgrades Prometheus-Operator to v0.64.0.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.64.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusagents.yaml
```

### From 3.x to 4.x

This version upgrades Prometheus-Operator to v0.63.0.

Run these commands to update the CRDs before applying the upgrade to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.63.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.63.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.63.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.63.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.63.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.63.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.63.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.63.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
```

### From 2.x to 3.x

This version upgrades Prometheus-Operator to v0.62.0.

Run these commands to update the CRDs before applying the upgrade if you are `not using ArgoCD` to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.62.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.62.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.62.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.62.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.62.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.62.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.62.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.62.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
```

### From 1.x to 2.x

This version upgrades Prometheus-Operator to v0.60.0.

Run these commands to update the CRDs before applying the upgrade if you are `not using ArgoCD` to deploy the operator.
For better compatibility and upgrade of the CRD versions, the prometheus-operator-crd-full are used to maintain multiple versions of the CRD to ease migration.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.60.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.60.0/example/prometheus-operator-crd-full/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.60.0/example/prometheus-operator-crd-full/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.60.0/example/prometheus-operator-crd-full/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.60.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.60.0/example/prometheus-operator-crd-full/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.60.0/example/prometheus-operator-crd-full/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.60.0/example/prometheus-operator-crd-full/monitoring.coreos.com_thanosrulers.yaml
```

### From 0.x to 1.x

This version upgrades Prometheus-Operator to v0.59.1.

Run these commands to update the CRDs before applying the upgrade if you are not using ArgoCD to deploy the operator.

```console
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.59.1/example/prometheus-operator-crd/monitoring.coreos.com_alertmanagerconfigs.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.59.1/example/prometheus-operator-crd/monitoring.coreos.com_alertmanagers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.59.1/example/prometheus-operator-crd/monitoring.coreos.com_podmonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.59.1/example/prometheus-operator-crd/monitoring.coreos.com_probes.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.59.1/example/prometheus-operator-crd/monitoring.coreos.com_prometheuses.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.59.1/example/prometheus-operator-crd/monitoring.coreos.com_prometheusrules.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.59.1/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.59.1/example/prometheus-operator-crd/monitoring.coreos.com_thanosrulers.yaml
```

## Configuration

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```console
helm show values arldka/prometheus-operator
```

You may also `helm show values` on this chart's [dependencies](#dependencies) for additional options.

## Work-Arounds for Known Issues

### Running on private GKE clusters

When Google configure the control plane for private clusters, they automatically configure VPC peering between your Kubernetes cluster’s network and a separate Google managed project. In order to restrict what Google are able to access within your cluster, the firewall rules configured restrict access to your Kubernetes pods. This means that in order to use the webhook component with a GKE private cluster, you must configure an additional firewall rule to allow the GKE control plane access to your webhook pod.

You can read more information on how to add firewall rules for the GKE control plane nodes in the [GKE docs](https://cloud.google.com/kubernetes-engine/docs/how-to/private-clusters#add_firewall_rules)

Alternatively, you can disable the hooks by setting `admissionWebhooks.enabled=false`.

## PrometheusRules Admission Webhooks

With Prometheus Operator version 0.30+, the core Prometheus Operator pod exposes an endpoint that will integrate with the `validatingwebhookconfiguration` Kubernetes feature to prevent malformed rules from being added to the cluster.

### How the Chart Configures the Hooks

A validating and mutating webhook configuration requires the endpoint to which the request is sent to use TLS. It is possible to set up custom certificates to do this, but in most cases, a self-signed certificate is enough. The setup of this component requires some more complex orchestration when using helm. The steps are created to be idempotent and to allow turning the feature on and off without running into helm quirks.

1. A pre-install hook provisions a certificate into the same namespace using a format compatible with provisioning using end user certificates. If the certificate already exists, the hook exits.
2. The prometheus operator pod is configured to use a TLS proxy container, which will load that certificate.
3. Validating and Mutating webhook configurations are created in the cluster, with their failure mode set to Ignore. This allows rules to be created by the same chart at the same time, even though the webhook has not yet been fully set up - it does not have the correct CA field set.
4. A post-install hook reads the CA from the secret created by step 1 and patches the Validating and Mutating webhook configurations. This process will allow a custom CA provisioned by some other process to also be patched into the webhook configurations. The chosen failure policy is also patched into the webhook configurations

### Alternatives

It should be possible to use [jetstack/cert-manager](https://github.com/jetstack/cert-manager) if a more complete solution is required, but it has not been tested.

You can enable automatic self-signed TLS certificate provisioning via cert-manager by setting the `admissionWebhooks.certManager.enabled` value to true.

### Limitations

Because the operator can only run as a single pod, there is potential for this component failure to cause rule deployment failure. Because this risk is outweighed by the benefit of having validation, the feature is enabled by default.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admissionWebhooks.caBundle | string | `""` |  |
| admissionWebhooks.certManager.admissionCert.duration | string | `""` |  |
| admissionWebhooks.certManager.enabled | bool | `false` |  |
| admissionWebhooks.certManager.rootCert.duration | string | `""` |  |
| admissionWebhooks.createSecretJob.securityContext | object | `{}` |  |
| admissionWebhooks.enabled | bool | `true` |  |
| admissionWebhooks.failurePolicy | string | `"Fail"` |  |
| admissionWebhooks.patch.affinity | object | `{}` |  |
| admissionWebhooks.patch.enabled | bool | `true` |  |
| admissionWebhooks.patch.image.pullPolicy | string | `"IfNotPresent"` |  |
| admissionWebhooks.patch.image.repository | string | `"registry.k8s.io/ingress-nginx/kube-webhook-certgen"` |  |
| admissionWebhooks.patch.image.tag | string | `"v20221220-controller-v1.5.1-58-g787ea74b6"` |  |
| admissionWebhooks.patch.nodeSelector | object | `{}` |  |
| admissionWebhooks.patch.podAnnotations | object | `{}` |  |
| admissionWebhooks.patch.priorityClassName | string | `""` |  |
| admissionWebhooks.patch.resources | object | `{}` |  |
| admissionWebhooks.patch.securityContext.runAsGroup | int | `2000` |  |
| admissionWebhooks.patch.securityContext.runAsNonRoot | bool | `true` |  |
| admissionWebhooks.patch.securityContext.runAsUser | int | `2000` |  |
| admissionWebhooks.patch.tolerations | list | `[]` |  |
| admissionWebhooks.patchWebhookJob.securityContext | object | `{}` |  |
| admissionWebhooks.timeoutSeconds | int | `10` |  |
| affinity | object | `{}` |  |
| alertmanagerConfigNamespaces | list | `[]` |  |
| alertmanagerInstanceNamespaces | list | `[]` |  |
| annotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| denyNamespaces | list | `[]` |  |
| dnsConfig | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.rbac.create | bool | `true` |  |
| global.rbac.createAggregateClusterRoles | bool | `false` |  |
| global.rbac.pspAnnotations | object | `{}` |  |
| global.rbac.pspEnabled | bool | `false` |  |
| hostNetwork | bool | `false` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"quay.io/prometheus-operator/prometheus-operator"` |  |
| image.sha | string | `""` |  |
| image.tag | string | `"v0.71.2"` |  |
| kubeTargetVersionOverride | string | `""` |  |
| kubeVersionOverride | string | `""` |  |
| kubeletService.enabled | bool | `true` |  |
| kubeletService.name | string | `""` |  |
| kubeletService.namespace | string | `"kube-system"` |  |
| nameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |
| namespaces | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| prometheusConfigReloader.image.repository | string | `"quay.io/prometheus-operator/prometheus-config-reloader"` |  |
| prometheusConfigReloader.image.sha | string | `""` |  |
| prometheusConfigReloader.image.tag | string | `"v0.71.2"` |  |
| prometheusConfigReloader.resources.limits.cpu | string | `"200m"` |  |
| prometheusConfigReloader.resources.limits.memory | string | `"50Mi"` |  |
| prometheusConfigReloader.resources.requests.cpu | string | `"200m"` |  |
| prometheusConfigReloader.resources.requests.memory | string | `"50Mi"` |  |
| prometheusInstanceNamespaces | list | `[]` |  |
| resources | object | `{}` |  |
| secretFieldSelector | string | `""` |  |
| securityContext.fsGroup | int | `65534` |  |
| securityContext.runAsGroup | int | `65534` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| service.additionalPorts | list | `[]` |  |
| service.annotations | object | `{}` |  |
| service.clusterIP | string | `""` |  |
| service.externalIPs | list | `[]` |  |
| service.externalTrafficPolicy | string | `"Cluster"` |  |
| service.labels | object | `{}` |  |
| service.loadBalancerIP | string | `""` |  |
| service.loadBalancerSourceRanges | list | `[]` |  |
| service.nodePort | int | `30080` |  |
| service.nodePortTls | int | `30443` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| thanosImage.repository | string | `"quay.io/thanos/thanos"` |  |
| thanosImage.sha | string | `""` |  |
| thanosImage.tag | string | `"v0.33.0"` |  |
| thanosRulerInstanceNamespaces | list | `[]` |  |
| tls.enabled | bool | `true` |  |
| tls.internalPort | int | `10250` |  |
| tls.tlsMinVersion | string | `"VersionTLS13"` |  |
| tolerations | list | `[]` |  |
