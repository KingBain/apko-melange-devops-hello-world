# apko-melange-devops-hello-world

<!---
Note: Do NOT edit README.md directly. Edit .github/README.tpl.md instead.
-->

[![CI status](https://github.com/KingBain/apko-melange-devops-hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/KingBain/apko-melange-devops-hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `ghcr.io`:

```bash
docker pull ghcr.io/kingbain/apko-melange-devops-hello-world:latest
```

## Supported tags

| Tag | Arch |
| --- | ---- |
| `latest` | `amd64` `arm64` `arm` |
| `20260205` | `amd64` `arm64` `arm` |

## Signing
    
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```bash
cosign verify \
  --certificate-identity "https://github.com/KingBain/apko-melange-devops-hello-world/.github/workflows/release.yaml@refs/heads/main" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  ghcr.io/kingbain/apko-melange-devops-hello-world:20260205 | jq
```

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).