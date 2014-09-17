#TNK知の統合化PJ
###メンバー
10期：松永(PM)<br>
11期：比留間、山村



## railsに関する操作

#### railsサーバーをローカルで起動するとき
```
bundle exec rails s
```

#### DBを作成
```
bundle exec rake db:create
```

#### migrationを実行
```
bundle exec rak db:migrate RAILS_ENV=development
```




## 作業の基本フロー

#### 初めて作業をするとき
```
git clone git@github.com:sundown1230/TNK.git
```
httpsとsshの２つのclone方法がありますが、httpsにするとpushするたびにパスワードが必要になるのでsshを強く勧めます。
詳しくは松永まで。

#### 新しく作業をするとき

```
git checkout development
git pull origin development
git checkout -b 新しいブランチ名
```

### ブランチでの作業を終えた時
```
git push origin 作業ブランチ名
```
githubでpull requestを出す。
pull requestはmasterブランチに対してではなく、developmentブランチに対して行うこと。(デフォルトではmasterブランチになっている)
チームメンバー全員が確認したらdevelopmentにmerge

### 他の人の作業を手元で確認する場合
githubではコードを読むことができるが、実際に手元（ローカル）に持ってきて動作確認をしたほうが良い。コードと動作の両方でチェックしよう。他人の作ったブランチをリモートからローカルにチェックアウトする方法を以下の通り。
```
git checkout -b branch_name origin/branch_name
```


