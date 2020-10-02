FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:dev as precache
WORKDIR /source
COPY --chown=node:node . /source/

RUN mkdir /usr/local/etc/devcontainer-precache \
	&& chown vscode /usr/local/etc/devcontainer-precache \
	&& su vscode -c "yarn install && .devcontainer/precache/cache.sh"

FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:dev
COPY --chown=node --from=precache /usr/local/etc/devcontainer-precache /usr/local/etc/devcontainer-precache
