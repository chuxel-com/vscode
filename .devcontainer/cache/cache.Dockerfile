FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:dev

COPY --chown=node:node . /repo-source-tmp/
RUN mkdir /usr/local/etc/devcontainer-cache \
	&& chown node /usr/local/etc/devcontainer-cache /source \
	&& su node -c "\
		cd /repo-source-tmp \
		&& .devcontainer/cache/before-cache.sh \
		&& yarn install \
		&& yarn electron \
		&& yarn compile \
		&& yarn cache clean \
		&& .devcontainer/cache/cache-diff.sh" \
	&& rm -rf /repo-source-tmp
