FROM dev-base

ARG SOURCE_DIR=src
COPY --chown=develop $SOURCE_DIR src

CMD [ "zsh" ]
