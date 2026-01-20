# Start from a base image like Ubuntu
FROM ubuntu:latest

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Dependencies
# (GUI files are already stripped by default in ubuntu:latest)
RUN apt-get update && apt-get install -y \
		valgrind \
		git \
		vim \
		neovim \
		curl \
		zsh \
		build-essential \
		cmake \
# --- Oh My Zsh Installation ---
		&& git clone https://github.com/ohmyzsh/ohmyzsh.git /root/.oh-my-zsh \
		&& cp /root/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc \
# --- Cleanup ---
		&& rm -rf /var/lib/apt/lists/*

# Added absolute path '/' to ensure it goes to the right place
COPY entrypoint.sh /usr/local/bin/

# 3. Make it executable
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
