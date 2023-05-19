---
variant: openshift
version: ${OCP_VER}.0
metadata:
  name: 99-worker-registry-proxy
  labels:
    machineconfiguration.openshift.io/role: worker
storage:
  files:
  - path: /etc/containers/registries.conf.d/003-harbor-proxy.conf
    mode: 0644
    overwrite: true
    contents:
      inline: |
        [[registry]]
          prefix = ""
          mirror-by-digest-only = false
          location = "registry.connect.redhat.com"

          [[registry.mirror]]
            # redhat-connect
            location = "${LOCAL_REGISTRY}:${LOCAL_REGISTRY_PORT}/${HARBOR_PROJECT_REDHAT_CONNECT}

        [[registry]]
          prefix = ""
          mirror-by-digest-only = false
          location = "registry.redhat.io"

          [[registry.mirror]]
            # redhat-io
            location = "${LOCAL_REGISTRY}:${LOCAL_REGISTRY_PORT}/${HARBOR_PROJECT_REDHAT_IO}"