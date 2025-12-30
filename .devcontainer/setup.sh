#!/bin/bash
set -e

echo "Setting up Apko and Melange wrappers..."

docker pull cgr.dev/chainguard/apko:latest
docker pull cgr.dev/chainguard/melange:latest

# Create the 'apko' wrapper script
sudo tee /usr/local/bin/apko > /dev/null <<EOF
#!/bin/bash
docker run --rm -v "\${PWD}:/work" -w /work cgr.dev/chainguard/apko:latest "\$@"
EOF

# Create the 'melange' wrapper script

sudo tee /usr/local/bin/melange > /dev/null <<EOF
#!/bin/bash
docker run --privileged --rm -v "\${PWD}:/work" -w /work cgr.dev/chainguard/melange:latest "\$@"
EOF

# Make them executable
sudo chmod +x /usr/local/bin/apko
sudo chmod +x /usr/local/bin/melange

echo "Setup complete! You can now use 'apko', 'melange', and 'cosign'."