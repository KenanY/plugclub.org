require "rubygems"
require "bundler/setup"
require "stringex"
require 'rake/minify'

ssh_user       = "kenany_plugclub@ssh.phx.nearlyfreespeech.net"
ssh_port       = "22"
document_root  = "/home/public/"
rsync_delete   = true
deploy_default = "rsync"

public_dir      = "_site"     # compiled site directory
source_dir      = "source"    # source file directory
blog_index_dir  = 'source'    # directory for your blog's index page (if you put your index in source/blog/index.html, set this to 'source/blog')
deploy_dir      = "_deploy"   # deploy directory (for GitHub pages deployment)
stash_dir       = "_stash"    # directory to stash posts for speedy generation
posts_dir       = "_posts"    # directory for blog files
themes_dir      = ".themes"   # directory for blog files
new_post_ext    = "markdown"  # default new post file extension when using the new_post task
new_page_ext    = "markdown"  # default new page file extension when using the new_page task
server_port     = "4000"      # port for preview server eg. localhost:4000

desc "Generate jekyll site"
task :generate do
  raise "### You haven't set anything up yet. First run `rake install` to set up an Octopress theme." unless File.directory?(source_dir)
  puts "## Generating Site with Jekyll"
  system "compass compile --css-dir #{source_dir}/css"
  system "jekyll"
end

desc "Move all stashed posts back into the posts directory, ready for site generation."
task :integrate do
  FileUtils.mv Dir.glob("#{source_dir}/#{stash_dir}/*.*"), "#{source_dir}/#{posts_dir}/"
end

desc "Clean out caches: .pygments-cache, .gist-cache, .sass-cache"
task :clean do
  [".pygments-cache/**", ".gist-cache/**"].each { |dir| rm_rf Dir.glob(dir) }
  rm "#{source_dir}/css/main.css" if File.exists?("#{source_dir}/css/main.css")
  system "compass clean"
  puts "## Cleaned Sass, Pygments and Gist caches, removed generated stylesheets ##"
end

desc "Default deploy task"
task :deploy do
  # Check if preview posts exist, which should not be published
  if File.exists?(".preview-mode")
    puts "\n## Found posts in preview mode, regenerating files ..."
    File.delete(".preview-mode")
    Rake::Task[:generate].execute
    Rake::Task[:minify].execute
  end

  Rake::Task[:copydot].invoke(source_dir, public_dir)
  Rake::Task["#{deploy_default}"].execute
end

desc "copy dot files for deployment"
task :copydot, :source, :dest do |t, args|
  files = [".htaccess", ".nojekyll"]
  Dir["#{args.source}/.*"].each do |file|
    if !File.directory?(file) && files.include?(File.basename(file))
      cp(file, file.gsub(/#{args.source}/, "#{args.dest}"));
    end
  end
end

desc "Deploy website via rsync"
task :rsync do
  exclude = ""
  if File.exists?('./rsync-exclude')
    exclude = "--exclude-from '#{File.expand_path('./rsync-exclude')}'"
  end
  puts "\n## Deploying website via Rsync"
  ok_failed system("rsync --chmod=u+rwX,g+rwX,o+rX,o-w -avze 'ssh -p #{ssh_port}' #{exclude} #{"--delete" unless rsync_delete == false} #{public_dir}/ #{ssh_user}:#{document_root}")
end

task :success do
  duration = (Time.now - @time).to_i
  puts "\n## Compile time #{duration} seconds"
  Notifu::show :message => "Build complete (#{duration} sec)", :title => "kenany.me", :type => :info, :time => 3 do |status|
    p Notifu::ERRORS.include? status
  end
end

def ok_failed(condition)
  if (condition)
    puts "OK"
  else
    puts "FAILED"
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end

desc "list tasks"
task :list do
  puts "Tasks: #{(Rake::Task.tasks - [Rake::Task[:list]]).join(', ')}"
  puts "(type rake -T for more detail)\n\n"
end

if $0 == __FILE__
  app = Rake.application
  app[:default].invoke
end