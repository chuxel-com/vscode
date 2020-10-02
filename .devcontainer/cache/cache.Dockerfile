FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:dev as cache
WORKDIR /source
COPY --chown=node:node . /source/

RUN mkdir /usr/local/etc/devcontainer-cache \
	&& chown node /usr/local/etc/devcontainer-cache /source \
	&& su node -c "yarn install && .devcontainer/cache/cache.sh"

FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:dev
RUN mkdir /usr/local/etc/devcontainer-cache \
	&& chown node /usr/local/etc/devcontainer-cache /source \
COPY --chown=node --from=cache /usr/local/etc/devcontainer-precache /usr/local/etc/devcontainer-precache
