FROM ubuntu:20.10

ENV DEBIAN_FRONTEND noninteractive

RUN echo "Europe/Rome" | tee /etc/timezone && \
    apt update && \
    apt install -y \
      fish \
      git \
      python3-venv \
      gnupg \
      tmux \
      ruby \
      sudo \
      neovim \
      fzf \
      ranger \
      silversearcher-ag \
      ripgrep \
      curl && \
    mkdir -p /tmp/starship && \
    curl -s https://api.github.com/repos/starship/starship/releases/latest | \
      grep browser_download_url | \
      grep x86_64-unknown-linux-gnu | \
      cut -d "\"" -f 4 | \head -n 1 | xargs curl -L | tar -xvz -C /tmp/starship/ && \
    cp /tmp/starship/starship /usr/bin/starship
      
RUN groupadd alice && \
    useradd -m -s /bin/fish -g alice -G sudo alice && \
    echo "alice:alice" | chpasswd

COPY ./home /home/alice

RUN mkdir -p /home/alice/.config && \
    chown -R alice:alice /home/alice/.config && \
    chown alice:alice /home/alice/.bashrc && \
    mkdir -p /work && \
    chown alice:alice /work

USER alice

ENV NVM_DIR /home/alice/.nvm

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && \
    . /home/alice/.nvm/nvm.sh && \
    sh -c 'curl -fLo /home/alice/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
    nvm install 15 && \
    npm i -g yarn && \
    nvim --headless +PlugInstall +qall && \
    timeout 1m nvim --headless +CocInstall; exit 0 && \
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
    curl -fsSL https://starship.rs/install.sh | bash && \
    curl https://keybase.io/mortenolsen/pgp_keys.asc | gpg --import

WORKDIR /work


