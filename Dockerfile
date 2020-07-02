FROM node:14

# LABEL com.github.actions.name="ESLint Action"
# LABEL com.github.actions.description="Lint your Javascript projects with inline lint error annotations on pull requests."
# LABEL com.github.actions.icon="code"
# LABEL com.github.actions.color="yellow"

# `node-gyp rebuild` (sometimes triggered by `yarn install`) fails whenever it's run. To fix, install "alpine-sdk"
# package. See:
# - https://github.com/nodejs/node-gyp/issues/809#issuecomment-465476598
# - https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
# RUN apk add --update alpine-sdk

COPY . /action

RUN mkdir -p /github/workspace && chown -R node:node /github/workspace
USER node

ENTRYPOINT ["/action/entrypoint.sh"]
