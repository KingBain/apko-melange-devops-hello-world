# ${REPO_NAME}

<!---
Note: Do NOT edit README.md directly. Edit .github/README.tpl.md instead.
-->

[![CI status](${WORKFLOW_URL}/badge.svg)](${WORKFLOW_URL})

${DESCRIPTION}

## Get It!

The image is available on `ghcr.io`:

```bash
docker pull ${IMAGE_REPO}:${TAG}
```

## Supported tags

| Tag | Arch |
| --- | ---- |
| `${TAG}` | `amd64` `arm64` `arm` |
| `${TAG}-amd64` | `amd64` |
| `${TAG}-arm64` | `arm64` |
| `${TAG}-arm` | `arm` |

## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```bash
COSIGN_EXPERIMENTAL=1 cosign verify ${IMAGE_REPO}:${TAG} | jq
```

> **Note:** The output will contain the specific digest and signature information for the build timestamped `${TAG}`.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).