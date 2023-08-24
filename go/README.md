# Go言語の実行環境
## 使いかた
```bash
mkdir -p ssh
ssh-keygen -t ed25519 -C "your_email@gmail.com" -f $(pwd)/ssh/my-golang-app
cat ssh.config >> ~/.ssh/config
cp -p my-golang-app ~/.ssh
ssh my-golang-app
```
