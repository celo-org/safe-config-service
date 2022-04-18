# Safe Config Service Helm chart

Helm chart for safe-config-service, deployed to GCP [Artifact Repository](https://console.cloud.google.com/artifacts/docker/clabs-gnosis-safe/us-central1/charts?project=clabs-gnosis-safe&supportedpurview=project) as OCI Helm chart `safe-config-service-chart`.

## Artifact Repository CI

The chart is deployed to Artifact Repository through Cloud Build (using [../cloudbuild.yaml file](../cloudbuild.yaml)).

> :warning: ***If you modify the chart templates and want to publish a new chart version, please remember to change the `version:` number in [Chart.yaml](./Chart.yaml)***

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.10.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Kubernetes pod affinity |
| fullnameOverride | string | `""` | Chart full name override |
| global.postgresql.postgresqlDatabase | string | `""` | Postgresql dependency chart database for storing data |
| global.postgresql.postgresqlPassword | string | `""` | Postgresql dependency chart password |
| image.pullPolicy | string | `"IfNotPresent"` | Image pullpolicy |
| image.repository | string | `"us-central1-docker.pkg.dev/clabs-gnosis-safe/charts/safe-config-service"` | Image repository |
| image.tag | string | `"7563d11ebf253aa251177eb010e14f23e03ac73e"` | Image tag |
| imagePullSecrets | list | `[]` | Image pull secrets |
| livenessProbe | object | `{"timeoutSeconds":30}` | Liveness probe configuration |
| nameOverride | string | `""` | Chart name override |
| nodeSelector | object | `{}` | Kubernetes node selector |
| podAnnotations | object | `{}` | Custom pod annotations |
| podSecurityContext | object | `{}` | Custom pod security context |
| readinessProbe | object | `{"timeoutSeconds":30}` | Readiness probe configuration |
| replicaCount | int | `1` | Number of deployment replicas |
| resources | object | `{}` | Container resources |
| safeConfigService.secretKey | string | `""` | Secret key for safe-config-service |
| securityContext | object | `{}` | Custom container security context |
| service.port | int | `80` | Kubernetes Service Type |
| service.type | string | `"ClusterIP"` | Kubernetes Service Type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Kubernetes tolerations |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.7.0](https://github.com/norwoodj/helm-docs/releases/v1.7.0)