# Docker課題

### 環境
* Mac M1
* centos7
* Docker Desktop

### 構築手順
1. dockerfileを基にイメージ作成
```html
docker build -t {ここに自分のname}/httpd . 
```

2. ホスト側のポートの 8080 番を Container 側の 80 番にリダイレクトし、バックグランドで実行
```html
docker run -p 8080:80 -d hayata/httpd
```
<img width="1512" alt="docker_run" src="https://user-images.githubusercontent.com/79523559/171452634-bea83771-d13e-4b9e-923d-e30244792f73.png">


### エラーが出て詰まった部分
##### Dockerfileで「FROM centos」と記述するとcentos8系がインストールされ、httpdのインストールに失敗するということが起きました。
* 対処法
Dockerfileの中身を
```html
FROM centos:centos7
```
とするとうまくインストールされます。

##### dockerにloginしているにもかかわらず、docker pushをしたら拒否されてしまうエラー
* 対処法
[docker push イメージ（ユーザー名/任意の名前）] このように指定をしなければpushを拒否られてしまうため、dockerをbuildする際に決めるnameの部分はdokerでloginする際のユーザー名と同じにしなければならない

* Qiita参考記事↓

`https://qiita.com/shundayo/items/4ae35930fe9f85f535b0`

### 主なDockerコマンド
＊ イメージをダウンロードする
```html
docker pull イメージ名
```

* イメージからコンテナを作り出して動かすコマンド
```html
docker run イメージ名
```

* イメージが取得できたかを確認
```html
sudo docker images
```

* 実行中のContainer一覧を確認
```html
sudo docker ps 
```

* 終了しているContainer一覧を確認
```html
sudo docker ps -a
```
