guard 'bundler' do
  watch('Gemfile')
end

guard 'coffeescript', :input => '_site/js'

guard 'livereload' do
  watch(%r{_site/.+\.(css|js|html)})
end
