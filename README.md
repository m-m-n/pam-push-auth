# ビルド方法

1. 環境変数 `AUTH_SERVER_BASEURL` を設定する
    - 例) `export AUTH_SERVER_BASEURL="https://login.example.com"`
2. `config.h` を生成する
    - `make config`
3. ビルドする
    - `make`
4. インストールする
    - `make install`
