# Dev Docker

Docker setup for development in JavaScript, Python, Haskell, Rust, and Go.

## Steps to Run

```bash
# Pull the code
git clone git@github.com:gregorybchris/dev-docker.git
cd dev-docker

# Create and run the docker image
docker build -f dev.Dockerfile -t dev .
docker run --name dev-container -i -t dev zsh

# Test that all supported languages work
cd src && ./run-all.sh
```