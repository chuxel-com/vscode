# This dockerfile is used to build up from a base image to create an image with
# cached results of running "prepare.sh". It assumes the existance of a non-root
# user with a UID/GID of 1000. In this particular image, this is the "node" user.

# Image contents: https://github.com/microsoft/vscode-dev-containers/blob/master/repository-containers/images/github.com/microsoft/vscode/.devcontainer/base.Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:dev

ARG USER_UID=1000
ARG USER_GID=${USER_UID}
COPY --chown=${USER_UID}:${USER_GID} . /repo-source-tmp/
RUN mkdir /usr/local/etc/devcontainer-cache \
	&& chown ${USER_UID} /usr/local/etc/devcontainer-cache /repo-source-tmp \
	&& su ${USER_UID} -c "\
		cd /repo-source-tmp \
		&& .devcontainer/cache/before-cache.sh \
		&& .devcontainer/prepare.sh \
		&& .devcontainer/cache/cache-diff.sh" \
	&& rm -rf /repo-source-tmp
