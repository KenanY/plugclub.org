require File.expand_path('guards/guard-jekyll.rb', File.dirname(__FILE__))
require File.expand_path('guards/guard-uglify.rb', File.dirname(__FILE__))

group :frontend do
  guard "compass" do
    watch(/sass\/(.*)/)
  end

  guard 'coffeescript', :input => 'source/js/coffeescript', :output => 'source/js'

  guard "uglify",
    :input => [
      "source/js/plugins.js",
      "source/js/main.js"
    ],
    :output => "source/js/plugclub.min.js" do
    watch(/^source\/js\/(.*)\.js/)
  end

  guard "jekyll" do
    watch(/^source(.*)/)
  end
end

guard 'bundler' do
  watch('Gemfile')
end

# guard "livereload" do
#   watch(/^_site(.*)/)
# end