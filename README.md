# ArgoCD Applications

This directory contains ArgoCD Application manifests that define how applications are deployed to the Kubernetes cluster.

## Structure

- `applications/` - Individual Application manifests for each application

## Applications

- `certa.yaml` - Certa certificate management application
- `sins.yaml` - SiNS DNS server application
- `ollama.yaml` - Ollama LLM server with WebUI

## App of Apps Pattern

To have ArgoCD manage these applications from Git, you can set up an "app of apps" pattern:

1. Create a root Application that points to this Git repository
2. The root Application will discover and manage all Applications in the `applications/` directory
3. ArgoCD will automatically sync any changes from Git

## Usage

### Manual Apply
```bash
kubectl apply -f argocd/applications/
```

### Git-based Management
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
    path: argocd/applications
    targetRevision: main
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```
