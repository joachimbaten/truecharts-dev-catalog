{{/*
This template serves as the blueprint for the additional Deployment objects that are created

*/}}
{{- define "spotweb-nginx.deployment" -}}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "common.names.fullname" . }}-nginx
  labels:
    {{- include "common.labels" . | nindent 4 }}
    {{- with .Values.controller.labels }}
      {{- toYaml . | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common.annotations.workload" . | nindent 4 }}
    {{- with .Values.controller.annotations }}
      {{- toYaml . | nindent 4 }}
    {{- end }}
spec:
  replicas: {{ .Values.controller.replicas }}
  selector:
    matchLabels: 
      app.kubernetes.io/name: {{ include "common.names.name" . }}-nginx
      app.kubernetes.io/instance: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ include "common.names.name" . }}-nginx
        app.kubernetes.io/instance: {{ .Release.Name }}
    spec:
      containers:
      - name: {{ include "common.names.fullname" . }}-nginx
        image: "{{ .Values.nginxImage.repository }}:{{ .Values.nginxImage.tag }}"
        imagePullPolicy: {{ .Values.nginxImage.pullPolicy }}
        ports:
        - name: http
          containerPort: {{ .Values.service.main.ports.main.targetPort }}
        livenessProbe:
          httpGet:
            path: /
            port: http
          initialDelaySeconds: 30
          timeoutSeconds: 5
        readinessProbe:
          httpGet:
            path: /
            port: http
          initialDelaySeconds: 5
          timeoutSeconds: 1
        {{/*
          Merges the TrueNAS SCALE generated GPU info with the .Values.resources dict
        */}}
        {{- $resources := dict "limits" ( .Values.scaleGPU | default dict ) }}
        {{- $resources = merge $resources .Values.resources }}
        resources:
        {{- with $resources }}
          {{- toYaml . | nindent 10 }}
        {{- end }}
        volumeMounts:
          - name: nginx-config
            mountPath: /opt/bitnami/nginx/conf/server_blocks
      volumes:
        - name: nginx-config
          configMap:
            name: {{ include "common.names.fullname" . }}-nginx-config
{{- end }}