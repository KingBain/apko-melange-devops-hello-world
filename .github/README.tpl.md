# ${REPO_NAME}

<!---
Note: Do NOT edit README.md directly. Edit .github/README.tpl.md instead.
-->

[![CI status](${WORKFLOW_URL}/badge.svg)](${WORKFLOW_URL})

${DESCRIPTION}

## Get It!

The image is available on `ghcr.io`:

```bash
docker pull ${IMAGE_REPO}:latest
```

## Supported tags

| Tag | Arch |
| --- | ---- |
| `latest` | `amd64` `arm64` `arm` |
| `${TAG}` | `amd64` `arm64` `arm` |

## Signing
    
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```bash
cosign verify \
  --certificate-identity "https://github.com/${GITHUB_REPOSITORY}/.github/workflows/release.yaml@refs/heads/main" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  ${IMAGE_REPO}:${TAG} | jq
```

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).