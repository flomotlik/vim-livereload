desc "Install or Update Vim-Livereload."
task :default do
  puts "Pulling latest changes"
 `git pull > /dev/null`

  puts "Synchronising submodules urls"
 `git submodule sync > /dev/null`

  puts "Updating the submodules"
 `git submodule update --init > /dev/null`
end
