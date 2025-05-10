# PAM Push Authentication モジュール

## インストール手順

1. 環境変数 `AUTH_SERVER_BASEURL` を設定する
    - 例) `export AUTH_SERVER_BASEURL="https://login.example.com"`
2. `config.h` を生成する
    - `make config`
3. ビルドする
    - `make`
4. インストールする
    - `sudo make install`

## アンインストール手順

1. `sudo make uninstall`

## ビルド成果物の削除

1. `make clean`

## PAM設定ガイド

### 設定例

例) `/etc/pam.d/common-auth`

```conf
# ログインプッシュ通知
auth [success=3 default=ignore] pam_push_auth.so
```

### 設定の注意点

通常のパスワードログインは `pam_unix.so` を呼ぶのでその前に設定しておく  
success=3 は成功した場合に次の3行をスキップする  
もともと以下のような記述がある場合、これに先駆けて実行することでデフォルトのパスワード認証をスキップできる
```
auth  [success=2 default=ignore]  pam_unix.so nullok
auth  [success=1 default=ignore]  pam_sss.so use_first_pass
auth  requisite     pam_deny.so
```
