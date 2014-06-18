#TNK地の統合化PJ



### railsに関する操作

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


### 作業の基本フロー

#### 初めて作業をするとき
```
git clone git@github.com:sundown1230/TNK.git
```
httpsとsshの２つのclone方法がありますが、httpsにするとpushするたびにパスワードが必要になるのでsshを強く勧めます。
詳しくは松永まで。

#### 新しく作業をするとき

```
git checkout development
git checkout -b 新しいブランチ名
```

### ブランチでの作業を終えた時
```
git push origin 作業ブランチ名
```
githubでpull requestを出す。
pull requestはmasterブランチに対してではなく、developmentブランチに対して行うこと。
チームメンバー全員が確認したらmasterにmerge


