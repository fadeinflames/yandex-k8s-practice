{{/*
Эта функция определяет базовое имя чарта
*/}}
{{- define "ghost-blog.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Эта функция создает полное имя приложения
*/}}
{{- define "ghost-blog.fullname" -}}
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
Создает метку с версией чарта
*/}}
{{- define "ghost-blog.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Определяет стандартный набор меток Kubernetes
*/}}
{{- define "ghost-blog.labels" -}}
helm.sh/chart: {{ include "ghost-blog.chart" . }}
{{ include "ghost-blog.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Определяет метки для селекторов
*/}}
{{- define "ghost-blog.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ghost-blog.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
