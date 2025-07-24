FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git curl \
    telnet nano unzip vim sudo wget 

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip  \
    && ./aws/install \
    && rm -rf awscliv2.zip aws

RUN apt-get install -y zsh 

RUN useradd -ms /bin/bash zero1 && \
    usermod -aG sudo zero1 && \
    echo "zero1 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/zero1 && \
    chmod 0440 /etc/sudoers.d/zero1

USER zero1
WORKDIR /home/zero1/data

RUN RUNZSH=no CHSH=no yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && cp /home/zero1/.oh-my-zsh/templates/zshrc.zsh-template /home/zero1/.zshrc

SHELL ["/bin/zsh", "-c"] 