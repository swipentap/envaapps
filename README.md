# ArgoCD Applications

This directory contains ArgoCD Application manifests that define how applications are deployed to the Kubernetes cluster.

## Structure

- `base/applications/` - Base Application manifests (prod defaults)
- `overlays/{dev,test}/` - Kustomize overlays; patches set targetRevision and env-specific values

## Applications

- `certa.yaml` - Certa certificate management application
- `sins.yaml` - SiNS DNS server application
- `ollama.yaml` - Ollama LLM server with WebUI

## App of Apps Pattern

To have ArgoCD manage these applications from Git, you can set up an "app of apps" pattern:

1. Create a root Application that points to this Git repository (path: `overlays/dev` or `overlays/test`, branch as needed).
2. The root Application includes `base` and applies overlay patches; Argo uses manifests from `base/applications/` plus patches.
3. ArgoCD will automatically sync any changes from Git.

## Usage

### Git-based Management (app of apps)
Set up a root Application that points to this repository:
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
