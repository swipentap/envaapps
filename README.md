# ArgoCD Applications

This directory contains ArgoCD Application manifests that define how applications are deployed to the Kubernetes cluster.

## Structure

- `base/applications/` - Base Application (root-apps) with prod helm values
- `overlays/dev/` - Patches root-apps with dev helm values (domain, tlsSecret, IPs)
- `overlays/test/` - Patches root-apps with test helm values
- `overlays/prod/` - Passthrough to base (prod values)

## Applications

- `certa.yaml` - Certa certificate management application
- `sins.yaml` - SiNS DNS server application
- `ollama.yaml` - Ollama LLM server with WebUI

## App of Apps Pattern

To have ArgoCD manage these applications, use a root Application (app-of-apps).

### Option A: Umbrella Helm chart (recommended)

The root Application is in `base/applications/root-apps.yaml`. It syncs from the **enva-umbrella** Helm chart (published at `https://swipentap.github.io/charts`). The umbrella chart renders all child Applications (cert-manager, certa, code-server, github-runner, mailu, ollama, postgresql, rancher, sins, tls-secret, traefik) with env-specific values.

- **Manifest:** `base/applications/root-apps.yaml` (prod). Overlays patch helm values per env.
- **Apply:** Enva "install argocd apps" uses path `overlays/<env>` and target_revision from the environment (dev/test/main) so each cluster gets root-apps with the correct helm values (domain, tlsSecret, mailu nodeHosts, postgresql pgadminHost, sins haproxyIp, rancher hostname).

### Option B: Git/Kustomize (legacy)

1. Create a root Application that points to this Git repository (path: `overlays/dev` or `overlays/test`, branch as needed).
2. The root Application includes `base` and applies overlay patches; Argo uses manifests from `base/applications/` plus patches.
3. ArgoCD will automatically sync any changes from Git.

Example root Application for Git-based management:
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: root-apps
  namespace: argocd
spec:
  project: default
  source:
    repoURL: <your-git-repo-url>
    path: overlays/dev
    targetRevision: dev
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```
Use `overlays/test` and `targetRevision: test` for test; base uses `main` for prod.
