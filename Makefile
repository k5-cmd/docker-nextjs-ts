# イメージ作成とコンテナ起動
# ※ app部分は任意、ここを変更する場合はdocker-compose.ymlファイルのcommand部分も変更する必要があります。  
# ※ --tsオプションをつけることでTypeScriptの設定を自動でしてくれます。
# ※ 途中で[Ok to proceed? (y)]と聞かれるので[echo y]をしています。
create-image : 
	echo y | docker compose run --rm app npx create-next-app app --ts

# コンテナ起動
up : 
	docker compose up -d