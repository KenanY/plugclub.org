group :frontend do
  guard "compass" do
    watch(/sass\/(.*)/)
  end

  guard "jekyll" do
    watch(/^source\/(.*)/)
  end
end

# guard 'coffeescript', :input => 'source/js', :output => '_site/js'

guard 'bundler' do
  watch('Gemfile')
end

guard "livereload" do
  watch(/^_site(.*)/)
end