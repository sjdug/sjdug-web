# https://gist.github.com/afeld/5704079
namespace :assets do
  desc "A little hack to make sprockets handle Bower files"
  # Add extensions to all Bower-installed files that don't have them.
  # See https://github.com/sstephenson/sprockets/issues/347
  task :precompile do
    Dir['vendor/assets/bower_components/**/*'].each do |filename|
      if File.file?(filename) && File.extname(filename) == ''
        File.rename(filename, "#{filename}.txt")
      end
    end
  end
end

require File.expand_path('../config/application', __FILE__)

SjdugWeb::Application.load_tasks
