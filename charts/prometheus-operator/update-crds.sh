#!/bin/bash

set -e

ROOT_URL="https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v$1/example/prometheus-operator-crd/"

curl -s "${ROOT_URL}monitoring.coreos.com_alertmanagerconfigs.yaml" -o templates/crd-alertmanagerconfigs.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_alertmanagers.yaml" -o templates/crd-alertmanagers.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_podmonitors.yaml" -o templates/crd-podmonitors.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_probes.yaml" -o templates/crd-probes.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_prometheuses.yaml" -o templates/crd-prometheuses.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_prometheusrules.yaml" -o templates/crd-prometheusrules.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_servicemonitors.yaml" -o templates/crd-servicemonitors.yaml
curl -s "${ROOT_URL}monitoring.coreos.com_thanosrulers.yaml" -o templates/crd-servicemonitors.yaml

sed  -z -i 's/---\n//' templates/crd-*
sed -i -z 's/creationTimestamp: null/{{- if .Values.argocdInstall }}\n    argocd.argoproj.io\/sync-options: Replace=true\n  {{- end  }}/' templates/crd-*