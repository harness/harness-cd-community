{{/*
Expand the name of the chart.
*/}}
{{- define "harness.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "harness.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "harness.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "harness.labels" -}}
helm.sh/chart: {{ include "harness.chart" . }}
{{ include "harness.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "harness.selectorLabels" -}}
app.kubernetes.io/name: {{ include "harness.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Deployment labels
*/}}
{{- define "harness.deployment.labels" -}}
{{ include "harness.labels" . }}
{{- if .Values.deployment.labels }}
{{ toYaml .Values.deployment.labels }}
{{- end }}
{{- end }}

{{/*
Replica/Pods labels
*/}}
{{- define "harness.replica.labels" -}}
{{ include "harness.labels" . }}
{{- if .Values.replica.labels }}
{{ toYaml .Values.replica.labels }}
{{- end }}
{{- end }}

{{/*
Service labels
*/}}
{{- define "harness.service.labels" -}}
{{ include "harness.labels" . }}
{{- if .Values.service.labels }}
{{ toYaml .Values.service.labels }}
{{- end }}
{{- end }}

{{/*
ConfigMap labels
*/}}
{{- define "harness.configMap.labels" -}}
{{ include "harness.labels" . }}
{{- if .Values.configMap.labels }}
{{ toYaml .Values.configMap.labels }}
{{- end }}
{{- end }}

{{/*
Secret labels
*/}}
{{- define "harness.secret.labels" -}}
{{ include "harness.labels" . }}
{{- if .Values.secret.labels }}
{{ toYaml .Values.secret.labels }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "harness.serviceAccountName" -}}
{{- default "harness-default" .Values.serviceAccount.name }}
{{- end }}
