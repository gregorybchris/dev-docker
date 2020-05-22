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
ARG USER_NAME="chris"
ARG USER_PASSWORD="chrisdev##"
RUN useradd --create-home --shell /bin/zsh --password $USER_PASSWORD $USER_NAME \
    && echo "$USER_NAME:$USER_PASSWORD" | chpasswd \
    && usermod -aG sudo $USER_NAME
USER $USER_NAME

# Install Zsh and Antigen
WORKDIR /home/$USER_NAME
ENV ZSH_THEME robbyrussell
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN curl -L git.io/antigen > .antigen.zsh

# Copy Zsh settings
COPY --chown=chris dev-zshrc /home/$USER_NAME/.zshrc

# Install Miniconda
# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
#     && bash Miniconda3-latest-Linux-x86_64.sh -b \
#     && rm -f Miniconda3-latest-Linux-x86_64.sh

# Install Haskell
# RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Install Homebrew (takes ~400MB to install)
# If using, add /home/chris/.linuxbrew/bin to PATH
# RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Set standard Git aliases
RUN git config --global alias.co checkout \
    && git config --global alias.br branch \
    && git config --global alias.ci commit \
    && git config --global alias.st status

ARG SOURCE_DIR="src"
COPY --chown=chris $SOURCE_DIR src


CMD [ "zsh" ]

# STEPS TO RUN
# docker build -f dev.Dockerfile -t chrisdev .
# docker run -i -t chrisdev zsh