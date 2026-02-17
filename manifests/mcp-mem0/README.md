# mcp-mem0 (coleam00/mcp-mem0)

No public container image is published. Build and push from the repo:

```bash
git clone https://github.com/coleam00/mcp-mem0.git && cd mcp-mem0
docker build -t ghcr.io/YOUR_ORG/mcp-mem0:main --build-arg PORT=8050 .
docker push ghcr.io/YOUR_ORG/mcp-mem0:main
```

Then set `spec.template.spec.containers[0].image` in `deployment.yaml` to your image.
