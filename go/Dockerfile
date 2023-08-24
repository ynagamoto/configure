FROM golang:latest

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# ローカルの公開鍵ファイルをコンテナ内の~/.ssh/authorized_keysに追加
COPY ./ssh/my-golang-app.pub /root/.ssh/authorized_keys

# ssh で接続すると golang のパスが通ってないのでパスを通す
RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /root/.bashrc

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
