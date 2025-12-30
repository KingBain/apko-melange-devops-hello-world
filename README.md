# hello-world

<!---
Note: Do NOT edit README.md directly. Edit .github/README.tpl.md instead.
-->

[![CI status](https://github.com/KingBain/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/KingBain/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `ghcr.io`:

```bash
docker pull ghcr.io/kingbain/hello-world:latest
```

## Supported tags

| Tag | Arch |
| --- | ---- |
| `latest` | `amd64` `arm64` `arm` |
| `20251230` | `amd64` `arm64` `arm` |

## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```bash
COSIGN_EXPERIMENTAL=1 cosign verify ghcr.io/kingbain/hello-world:20251230 | jq
```

> **Note:** The output will contain the specific digest and signature information for the build timestamped `20251230`.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).