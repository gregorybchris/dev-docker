FROM ubuntu:18.04

# Install Ubuntu packages
RUN apt-get update && \
    apt-get install -y sudo \
    # Core installs
    curl wget gnupg gcc git-core zsh vim \
    # Node
    npm nodejs \
    # Haskell requirements
    build-essential libffi-dev libffi6 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 \
    # Other
    autojump \
    # Locale
    locales \
    && locale-gen en_US.UTF-8

# User setup
ARG USER_NAME=develop
ARG USER_PASSWORD=password
RUN useradd --create-home --shell /bin/zsh --groups root,sudo --password $USER_PASSWORD $USER_NAME \
    && echo "$USER_NAME:$USER_PASSWORD" | chpasswd
USER $USER_NAME

# Set standard Git aliases
RUN git config --global alias.co checkout \
    && git config --global alias.br branch \
    && git config --global alias.ci commit \
    && git config --global alias.st status

# Install Zsh and Antigen
WORKDIR /home/$USER_NAME
ENV ZSH_THEME robbyrussell
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN curl -L git.io/antigen > .antigen.zsh

# Copy Zsh settings
COPY --chown=develop dev-zshrc.zsh /home/$USER_NAME/.zshrc

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

# Install Haskell
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 sh

# Install Go
RUN wget https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz \
    && tar -xvf go1.14.3.linux-amd64.tar.gz \
    && rm -f go1.14.3.linux-amd64.tar.gz

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

# Install Homebrew (takes ~400MB to install)
# RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

ARG SOURCE_DIR=src
COPY --chown=develop $SOURCE_DIR src

CMD [ "zsh" ]
