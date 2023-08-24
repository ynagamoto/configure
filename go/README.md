# Go言語の実行環境

## 構成
- app/
  - golang のコードを置くディレクトリ
  - コンテナにマウントされます

## 使いかた

このディレクト（configure/go）で以下のコマンドを実行
鍵の取り扱いに注意してください

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

vscode の Remote Explorer で my-golang-app に接続 
