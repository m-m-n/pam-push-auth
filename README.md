# ビルド方法

1. 環境変数 `AUTH_SERVER_BASEURL` を設定する
    - 例) `export AUTH_SERVER_BASEURL="https://login.example.com"`
2. `config.h` を生成する
    - `make config`
3. ビルドする
    - `make`
4. インストールする
    - `sudo make install`

# アンインストール

1. `sudo make uninstall`

# 成果物の削除

1. `make clean`

# PAMの設定ファイルについて

例) `/etc/pam.d/common-auth`

```conf
# ログインプッシュ通知
auth sufficient pam_push_auth.so
```

通常のパスワードログインは `pam_unix.so` を呼ぶのでその前に設定しておく  
sufficientとしておくことで成功した場合は以降の処理を行わない
