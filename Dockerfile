# non root user example for alpine
#
# usage:
# $ docker build -t my_alpine_image .
# $ docker run -it --rm my_alpine_image

FROM alpine

# Set username
ARG USER="myusername"
ENV HOME /home/$USER

# Install zsh
RUN apk update && \
    apk add zsh git vim zsh-autosuggestions zsh-syntax-highlighting && \
    rm -rf /var/cache/apk/*

# Install oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Insert source highlighting and autosuggestions in .zshrc
RUN echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc && \
	echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# install sudo as root
RUN apk add --update sudo

# add new user
RUN adduser -D $USER \
        && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
        && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

ENTRYPOINT /bin/zsh