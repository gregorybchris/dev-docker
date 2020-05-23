# Dev Docker

Docker setup for development in C, C++, Go, Haskell, Java, JavaScript, Python, and Rust.

## How to Use

```bash
# Pull the code
git clone git@github.com:gregorybchris/dev-docker.git
cd dev-docker
```

```bash
# Create the development docker image
# Note: this might take up to 6GB. Make sure you have enough disk space.
docker build --file dev.Dockerfile --tag dev .

# Run the image and mount the dev-docker project source for testing
docker run -it --mount type=bind,source="$(pwd)",target=/home/develop/src dev zsh

# Test that all supported languages work
zsh src/lang-check/check-all.sh
```

```bash
# Create an image with a custom project mounted
# Replace <path-to-project> with an absolute path
docker run -it --mount type=bind,source="<path-to-project>",target=/home/develop/src dev zsh
```