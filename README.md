# Dev Docker

Docker setup for development in Javascript, Python, Haskell, and Go.

## Steps to Run

```bash
git clone git@github.com:gregorybchris/dev-docker.git
cd dev-docker

docker build -f dev.Dockerfile -t dev .
docker run -i -t dev zsh
```