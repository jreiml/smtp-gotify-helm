{{- define "smtp-gotify.name" -}}
{{- .Release.Name -}}
{{- end -}}

{{- define "smtp-gotify.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}
