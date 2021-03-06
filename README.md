# plugclub.org

[![dependency status](https://gemnasium.com/KenanY/plugclub.org.png)](https://gemnasium.com/KenanY/plugclub.org)

## Components

  * The P.L.U.G. site is a static site generated by [Jekyll], a Ruby blog generator.
  * HTML5 and CSS3, of course.
  * CSS generated by [Compass] and [Sass].
  * ZURB's [Foundation] is used as a responsive grid.
  * [jQuery] is used for plugins and stuff.
  * [Modernizr] is used mostly as a script loader (actually [yepnope.js]), but there is some minor feature-testing involed in the site.
  * On the front page, there's a counter which increases in random increments. To generate better pseudo-random numbers, [Alea.js] is used (with its dependency: [Mash.js]).
  * The primary javascript file (`main.js`) is generated from `main.coffee`, which is naturally written in [CoffeeScript].
  * Page-specific javascript is handled by [Fayer.js].
  * `plugins.js` and `main.js` are concatenated and minified by [UglifyJS] through the [uglifier] gem.
  * Site is deployed to server via [rsync].

## Initial setup

1. Install [Git].

2. The [guard] gem that you'll use later requires Growl. If you're using Linux, that means you'll need Growl for Linux:
```bash
$ sudo add-apt-repository ppa:mattn/growl-for-linux
$ sudo apt-get update
$ sudo apt-get install growl-for-linux
```

3. If you don't have [RVM], it's time to get it. It'll let you install Ruby easily and switch versions smoothly
```bash
$ curl -L https://get.rvm.io | bash -s stable --ruby
```

4. Be sure to follow any subsequent instructions as guided by the installation process.

5. Now install Ruby
```bash
$ rvm install 1.9.3
$ rvm use 1.9.3
$ rvm rubygems latest
```

6. Run `ruby --version` to be sure you’re using Ruby 1.9.3. If you’re having trouble, [seek help here][RVM support].

7. Get the repository
```bash
$ git clone git://github.com/KenanY/plugclub.org.git
$ cd octopress
```

8. When you `cd` into the folder, RVM will ask if you trust the `.rvmrc` file. Say yes.

9. Install dependencies (using the bundler gem)
```bash
$ gem install bundler
$ bundle install
```

## Changelog

### 1.2.0 / 2012-08-25 / [browse](/KenanY/plugclub.org/tree/1.2.0) / [zip](/KenanY/plugclub.org/zipball/1.2.0) / [tar](/KenanY/plugclub.org/tarball/1.2.0)

   * Use real black
   * Gray-ish background
   * No more Google Web Fonts
   * Remove GitHub column and instead put the latest commit SHA in the footer
   * Fix blank OG description
   * Add meta Twitter description and title
   * Use [Fayer.js] for page-specific javascript
   * Use [Alea.js] for random number generation
   * Use MBP helper.js to hide URL bar on mobile devices
   * Kitty placeholder where GitHub column used to be
   * Rewrite homepage features so that open-source doesn't clog our minds

### 1.1.0 / 2012-08-18 / [browse](/KenanY/plugclub.org/tree/1.1.0) / [zip](/KenanY/plugclub.org/zipball/1.1.0) / [tar](/KenanY/plugclub.org/tarball/1.1.0)

   * Front page redesign, complete with a cool tagline, random stats, columns of features, and a GitHub column tracking site updates
   * Add `feed_entry.xml`
   * Add async GA snippet
   * Remove address bar on mobile devices
   * Add Foundation jQuery plugins:
     * Alets
     * Buttons
     * Accordian
     * Navigation
     * mediaQueryToggle
     * Tabs
   * Remove copyright hyphen
   * Fix awkward wording in Officer bios
   * Minify Foundation plugins

### 1.0.3 / 2012-08-12 / [browse](/KenanY/plugclub.org/tree/1.0.3) / [zip](/KenanY/plugclub.org/zipball/1.0.3) / [tar](/KenanY/plugclub.org/tarball/1.0.3)

   * Update jQuery to 1.8.0
   * Include local copy of jQuery if Google's CDN is offline
   * Two-space indent `plugins.js` and `Modernizr.load` snippet

### 1.0.2 / 2012-08-05 / [browse](/KenanY/plugclub.org/tree/1.0.2) / [zip](/KenanY/plugclub.org/zipball/1.0.2) / [tar](/KenanY/plugclub.org/tarball/1.0.2)

   * Fix canonical link and description capturing
   * Fix officer avatars pointing to incorrect directory
   * Put `Modernizr.load` snippet at bottom of page instead of within a JavaScript file
   * Put treasurer above secretary on about page

### 1.0.1 / 2012-08-05 / [browse](/KenanY/plugclub.org/tree/1.0.1) / [zip](/KenanY/plugclub.org/zipball/1.0.1) / [tar](/KenanY/plugclub.org/tarball/1.0.1)

   * Add favicon to head
   * Cachebust `main.css`
   * Stop navigation from disappearing on small screens (see #4)
   * Remove duplicate header div
   * Add blog styles

### 1.0.0 / 2012-08-04 / [browse](/KenanY/plugclub.org/tree/1.0.0) / [zip](/KenanY/plugclub.org/zipball/1.0.0) / [tar](/KenanY/plugclub.org/tarball/1.0.0)

   * Beginning of using version numbering


   [Alea.js]: http://baagoe.org/en/w/index.php/Better_random_numbers_for_javascript#Alea
   [CoffeeScript]: http://coffeescript.org/
   [Compass]: http://compass-style.org/
   [Fayer.js]: http://sandeepjain.github.com/fayer/
   [Foundation]: http://foundation.zurb.com/
   [Git]: http://git-scm.com/
   [guard]: https://github.com/guard/guard
   [Jekyll]: http://jekyllrb.com/
   [jQuery]: http://jquery.com/
   [Mash.js]: http://baagoe.org/en/w/index.php/Better_random_numbers_for_javascript#Mash
   [Modernizr]: http://modernizr.com/
   [rsync]: https://rsync.samba.org/
   [RVM]: https://rvm.io/
   [RVM support]: https://rvm.io/support
   [Sass]: http://sass-lang.com/
   [UglifyJS]: http://marijnhaverbeke.nl/uglifyjs
   [uglifier]: https://github.com/lautis/uglifier
   [yepnope.js]: http://yepnopejs.com/