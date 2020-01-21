Getting Started
##### 1. Check out the repository

```bash
  git clone git@github.com:Apachina/test_task.git
```

##### 2. Create database and load migrations

```bash
  rake db:create
  rske db:migrate
```

##### 3. Start the Rails server

```bash
  rails s
```

##### If you  want to watch coverage, please run tests and open coverage file after all tests:

```bash
  rspec
  xdg-open coverage/index.html
```