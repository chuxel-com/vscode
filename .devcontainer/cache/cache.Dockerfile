FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:dev as cache

WORKDIR /source
COPY --chown=node:node . /source/
RUN mkdir /usr/local/etc/devcontainer-cache \
	&& chown node /usr/local/etc/devcontainer-cache /source \
	&& .devcontainer/cache/before-cache.sh \
	&& su node -c "\
		yarn install \
		&& yarn electron \
		&& yarn compile \
		&& .devcontainer/cache/cache-diff.sh"

FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:dev
RUN mkdir /usr/local/etc/devcontainer-cache \
	&& chown node /usr/local/etc/devcontainer-cache
COPY --from=cache --chown=node /usr/local/etc/devcontainer-cache /usr/local/etc/devcontainer-cache
