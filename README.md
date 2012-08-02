# plugclub.org

## Initial setup

```bash
# If you're using Linux, you'll need to install Growl for Linux
$ sudo add-apt-repository ppa:mattn/growl-for-linux
$ sudo apt-get update
$ sudo apt-get install growl-for-linux

# If you don't have RVM, it's time to get it
$ curl -L https://get.rvm.io | bash -s stable --ruby

Close your current shell and open a new one

# Run this. The output should be "rvm is a function"
$ type rvm | head -n 1

# To finish the RVM installation, run this and do whatever it requires of you
$ rvm requirements

# So, for Ubuntu, this might be what you need to run:
$ sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

# Now we can install Ruby
$ rvm install 1.9.2
$ rvm use 1.9.2

# Get the repository
$ git clone git://github.com/KenanY/plugclub.org.git
$ cd octopress

# Install dependencies (using bundler, which you must install beforehand)
$ gem install bundler
$ bundle install
```