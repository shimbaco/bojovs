# bojovs.com

いろいろなブログを触って来ましたが、なかなかしっくり来るものに出会えなかったため、
自分で作ることにしました。


## セットアップ

```
$ git clone git@github.com:bojovs/bojovs.git
$ cd bojovs
$ cp config/database.yml.sample config/database.yml
$ cp config/sunspot.yml.sample config/sunspot.yml
$ bundle
$ bundle exec rake sunspot:solr:start
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rails s
```


## テストの実行

```
$ bake sunspot:solr:start RAILS_ENV=test
$ bundle exec rake spec
```
