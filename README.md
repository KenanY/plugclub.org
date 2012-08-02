# plugclub.org

## Initial setup

```
sudo add-apt-repository ppa:mattn/growl-for-linux
sudo apt-get update
sudo apt-get install growl-for-linux

rvm install 1.9.2
rvm use 1.9.2
git clone git://github.com/KenanY/plugclub.org.git
cd octopress
gem install bundler
bundle install
```