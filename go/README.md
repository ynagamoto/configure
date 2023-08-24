# Go言語の実行環境

## 使いかた

このディレクト（configure/go）で以下のコマンドを実行

```bash
mkdir -p ssh
```
```bash
ssh-keygen -t ed25519 -C "your_email@gmail.com" -f $(pwd)/ssh/my-golang-app
```
```bash
cat ssh.config >> ~/.ssh/config
```
```bash
cp -p my-golang-app ~/.ssh
```

vscode の Remote Explorer で接続 
