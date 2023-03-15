#!/bin/bash

set -e

ROOT_URL="https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v$1/example/prometheus-operator-crd/"

curl -s "${ROOT_URL}monitoring.coreos.com_alertmanagerconfigs.yaml" -o crds/crd-alertmanagerconfigs.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_alertmanagers.yaml" -o crds/crd-alertmanagers.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_podmonitors.yaml" -o crds/crd-podmonitors.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_probes.yaml" -o crds/crd-probes.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_prometheuses.yaml" -o crds/crd-prometheuses.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_prometheusrules.yaml" -o crds/crd-prometheusrules.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_servicemonitors.yaml" -o crds/crd-servicemonitors.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_thanosrulers.yaml" -o crds/crd-thanosrulers.yaml
sed  -z -i 's/---\n//' crds/crd-*
#sed -i -z 's/creationTimestamp: null/{{- if .Values.argocdInstall }}\n    argocd.argoproj.io\/sync-options: Replace=true\n  {{- end  }}/' crds/crd-*