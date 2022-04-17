## Next.jsのDocker環境構築[TypeScript] 

### 事前準備
- Makefileを一部使用しています。Macの場合はHomebrewをインストールしていると使用できると思いますが、Windowsの場合は下記リンクを参考に実行環境を整えてください。　　

  [Windows10環境でmakeをする方法](https://camedphone.com/archives/1192)

  ※MacでHomebrewをインストールしていない場合は下記リンクからインストールしてください。  
  [Homebrew](https://brew.sh/index_ja)

### イメージ作成
※ コマンド詳細はMakefile内を参照してください。

~~~shell
make create-image
~~~

### ホットリロードの設定  
next.config.jsファイルを下記のように修正する。

~~~ts
const nextConfig = {
    reactStrictMode: true,
    // 追加部分 開始
    webpackDevMiddleware: config => {
    config.watchOptions = {
    poll: 800,
    aggregateTimeout: 300,
    }
    return config
    },
    // 追加部分 終了
}
~~~

### コンテナ立ち上げ  
※ コマンド詳細はMakefile内を参照してください。
~~~shell
make up
~~~

### Webブラウザへのアクセス
[ローカル](http:localhost:3000)

### 不要になった時は下記を実行

- コンテナが立ち上がっている場合
  ~~~shell
  docker ps 
  ~~~

- 停止するコンテナの[CONTAINER ID]を確認するして、下記コマンドを実行する  
  ※もしない場合はコンテナが起動していないので次のステップに進む

  ~~~shell
  docker stop [調べたCONTAINER ID]
  ~~~

- 停止したコンテナを削除する

  ~~~shell
  docker rm [調べたCONTAINER ID]
  ~~~

- [IMAGE ID]を検索するため下記コマンドを実行する
  ~~~shell
  docker images 
  ~~~

- イメージを削除
  ~~~shell
  docker rmi [調べたIMAGE ID]
  ~~~
