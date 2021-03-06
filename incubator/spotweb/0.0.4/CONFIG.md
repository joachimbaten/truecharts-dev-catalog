# spotweb

![Version: 0.0.4](https://img.shields.io/badge/Version-0.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.5.1](https://img.shields.io/badge/AppVersion-1.5.1-informational?style=flat-square)

Spotweb is a decentralized usenet community based on the Spotnet protocol.

**Homepage:** <https://github.com/truecharts/apps/master/charts/incubator/spotweb>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| TrueCharts | info@truecharts.org | https://truecharts.org |

## Source Code

* <https://github.com/spotweb/spotweb>
* <https://hub.docker.com/r/jbaten/spotweb>
* <https://github.com/joachimbaten/spotweb-docker>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://truecharts.org/ | postgresql | 6.0.40 |
| https://truecharts.org | common | 8.9.26 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.DB_DATABASE | string | `"{{ .Values.postgresql.postgresqlDatabase }}"` |  |
| env.DB_ENGINE | string | `"pdo_pgsql"` |  |
| env.DB_PORT | string | `"5432"` |  |
| env.DB_SCHEMA | string | `"public"` |  |
| env.DB_USER | string | `"{{ .Values.postgresql.postgresqlUsername }}"` |  |
| env.SPOTWEB_FIRSTNAME | string | `"demo"` |  |
| env.SPOTWEB_LASTNAME | string | `"spotweb"` |  |
| env.SPOTWEB_MAIL | string | `"demo@spotweb.com"` |  |
| env.SPOTWEB_RETRIEVE | string | `"15min"` |  |
| env.SPOTWEB_SYSTEMTYPE | string | `"single"` |  |
| env.TZ | string | `"UTC"` |  |
| envValueFrom.DB_HOST.secretKeyRef.key | string | `"plainhost"` |  |
| envValueFrom.DB_HOST.secretKeyRef.name | string | `"dbcreds"` |  |
| envValueFrom.DB_PASSWORD.secretKeyRef.key | string | `"postgresql-password"` |  |
| envValueFrom.DB_PASSWORD.secretKeyRef.name | string | `"dbcreds"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"tccr.io/truecharts/spotweb"` |  |
| image.tag | string | `"v1.5.1@sha256:75fe32474598f89d7b0741c3b96eeebd6b346da5219e1eabf8ed9e769f7a98f5"` |  |
| podSecurityContext.runAsGroup | int | `0` |  |
| podSecurityContext.runAsUser | int | `0` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.existingSecret | string | `"dbcreds"` |  |
| postgresql.postgresqlDatabase | string | `"spotweb"` |  |
| postgresql.postgresqlUsername | string | `"spotweb"` |  |
| secret.SPOTWEB_PASSWORD | string | `"changeme"` |  |
| secret.SPOTWEB_USERNAME | string | `"myawesomeuser"` |  |
| securityContext.readOnlyRootFilesystem | bool | `false` |  |
| securityContext.runAsNonRoot | bool | `false` |  |
| service.main.ports.main.port | int | `10050` |  |
| service.main.ports.main.targetPort | int | `80` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
