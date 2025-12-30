# Local Build Guide

This guide explains how to build the project locally using the Dev Container environment. It covers compiling the APK package with **Melange** and building the final OCI container image with **Apko**.

## Prerequisites

Ensure you have opened this project in the provided **Dev Container**. This ensures `apko`, `melange`, and `cosign` are installed and configured correctly.

## 1. Generate Signing Keys

Before building packages, you need a cryptographic key pair. Melange uses the private key to sign the `.apk`, and Apko uses the public key to verify it.

Run the following command in the terminal:

```bash
melange keygen
```

**Output:**
- `melange.rsa`: The private key (DO NOT share this in production).
- `melange.rsa.pub`: The public key.

## 2. Build the Package (Melange)

Use Melange to compile the source code into an Alpine package (`.apk`).

Run the build command:

```bash
# Replace x86_64 with aarch64 if you are on an Apple Silicon Mac
melange build melange.yaml \
  --signing-key melange.rsa \
  --arch x86_64
```

**What this does:**
1.  Spins up a build environment.
2.  Runs the pipeline defined in `melange.yaml` (compile C code, strip binaries).
3.  Signs the package using `melange.rsa`.
4.  Outputs the result to `./packages/`.

You can verify the package was created:
```bash
ls -R packages/
```

## 3. Build the Container Image (Apko)

Now use Apko to compose the final container image using the APK we just built.

```bash
# Replace x86_64 with aarch64 if you are on an Apple Silicon Mac
apko build apko.yaml \
  hello-world:local \
  output.tar \
  --keyring-append melange.rsa.pub \
  --arch x86_64
```

**Flag Explanations:**
- `hello-world:local`: The tag to apply to the image.
- `output.tar`: The destination file for the OCI image.
- `--keyring-append`: Tells Apko to trust your local key (`melange.rsa.pub`) so it can install your custom `hello` package.

## 4. Run the Image

The build output is a standard Docker tarball. Load it into your Docker daemon:

```bash
docker load < output.tar
```

Now, run the image:

```bash
docker run --rm hello-world:local
```

**Expected Output:**
```text
Hello world!
```

---

## Troubleshooting

**Error: `ERROR: unable to lock database`**
If a build fails halfway, sometimes temporary lock files persist.
- **Fix:** Run `rm -rf packages/` and try building again.

**Error: `unsatisfiable constraints`**
Apko cannot find your package.
- **Fix:** Ensure you built the Melange package for the same architecture (`--arch`) that you are trying to build the Apko image for.
- **Fix:** Ensure `apko.yaml` contains the local repository definition:
  ```yaml
  repositories:
    - '@local ./packages'
  ```