h1. README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

2.1.1 (ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin13.0])

* System dependencies

MySQL

* Configuration

* Installation

Bundle install.

```sh
$ bundle install --path vendor/bundle --without production
$ bundle update
$ bundle install
$ bundle exec spring binstub --all
```

* Database creation

```sh
$ mysql -u root -p
Enter password:

mysql> GRANT ALL PRIVILEGES ON *.* TO 'u-note'@localhost IDENTIFIED BY 'u-note-password';
Query OK, 0 rows affected (0.02 sec)

mysql> select host,user from mysql.user;
+-----------+--------+
| host      | user   |
+-----------+--------+
| 127.0.0.1 | root   |
| ::1       | root   |
| localhost | root   |
| localhost | u-note |
+-----------+--------+
4 rows in set (0.00 sec)

mysql> quit
Bye
```

* Database initialization

```sh
$ bundle exec rake db:create --trace
$ bundle exec rake db:migrate --trace
```

* How to run the test suite

```sh
$ bundle exec rails server
```

Access http://localhost:3000/

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
