#!/usr/bin/env bash
ENV_IS_LOCALDEV=0
HELM_CHART_NAME="arvigtestcluster334d-canary"
HELM_CHART_LOC="."
IMAGE_REPOSITORY="arvigtestcluster334d"
IMAGE_TAG="145"
KUB_REGISTRY_NAME="k3d-registry.local.arvig.com"
KUB_REGISTRY_PORT="5001"

KUB_CLUSTER_NAME="k3d-arvig-test-cluster"
KUB_NAMESPACE="arvig-test-clusterb506"
SITE_DOMAIN="local.arvig.com"
CLUSTER_TLS_SECRET_NAME="arvig-local-tls"

INGRESS_NAME="${KUB_NAMESPACE}-ingress"


echo "Publishing Helm Chart ${HELM_CHART_LOC} on ${KUB_REGISTRY_NAME}:${KUB_REGISTRY_PORT}"

helm upgrade ${HELM_CHART_NAME} ${HELM_CHART_LOC} \
    --kube-context="${KUB_CLUSTER_NAME}" \
    --namespace "${KUB_NAMESPACE}" \
    --set namespace=${KUB_NAMESPACE} \
    --set localDev=${ENV_IS_LOCALDEV} \
    --set serviceCode=${HELM_CHART_NAME} \
    --set image.registry=${KUB_REGISTRY_NAME}:${KUB_REGISTRY_PORT} \
    --set image.repository=${IMAGE_REPOSITORY} \
    --set image.tag=${IMAGE_TAG} \
    --set deployment.name=${HELM_CHART_NAME} \
    --set service.name=${HELM_CHART_NAME} \
    --set ingress.name=${INGRESS_NAME} \
    --set ingress.host=${HELM_CHART_NAME}.${SITE_DOMAIN} \
    --set ingress.tlsSecret=${CLUSTER_TLS_SECRET_NAME} \
    --set selectorLabels.app=${HELM_CHART_NAME} \
    --install;


# ENV_IS_LOCALDEV=0
# HELM_CHART_NAME="arvigtestcluster334d-canary"
# HELM_CHART_LOC="."
# SITE_DOMAIN="local.arvig.com"
# CLUSTER_TLS_SECRET_NAME="arvig-local-tls"

# cluster="k3d-arvig-test-cluster"
# deployment="arvigtestcluster334d"
# namespace="arvig-test-clusterb506"

# containerRegistry="k3d-registry.arvig.dev"
# containerRegistryPort="5000"
# imageRepository="arvigtestcluster334d"
# tag="145"

# echo "Publishing Helm Chart ${HELM_CHART_LOC} on ${cluster} using ${containerRegistry}:${containerRegistryPort}"
# echo "--------------------------------"
# helm upgrade ${HELM_CHART_NAME} ${HELM_CHART_LOC} \
#     --kube-context="${cluster}" \
#     --namespace "${namespace}" \
#     --set namespace=${namespace} \
#     --set localDev=${ENV_IS_LOCALDEV} \
#     --set serviceCode=${HELM_CHART_NAME} \
#     --set image.registry=${containerRegistry}:${containerRegistryPort} \
#     --set image.repository=${imageRepository} \
#     --set image.tag=${tag} \
#     --set deployment.name=${deployment} \
#     --set service.name=${HELM_CHART_NAME} \
#     --set ingress.name=${HELM_CHART_NAME} \
#     --set ingress.host=${HELM_CHART_NAME}.${SITE_DOMAIN} \
#     --set ingress.tlsSecret=${CLUSTER_TLS_SECRET_NAME} \
#     --set selectorLabels.app=${HELM_CHART_NAME} \
#     --install;