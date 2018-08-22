require 'fileutils'
require 'bundler/setup'
require 'pathname'

Bundler::GemHelper.install_tasks

task :update do
  system 'npm update reasonably-simple-computer'

  if $?.exitstatus != 0
    puts 'npm update failed'
    exit $?.exitstatus
  end

  engine_root = Pathname(__dir__)
  src_root = %w(node_modules reasonably-simple-computer)

  files = {
    %w(dist rsc.min.css) => %w(app assets stylesheets rsc),
    %w(dist rsc.min.js) => %w(app assets javascripts rsc),
    %w(dist images *) => %w(app assets images rsc)
  }

  files.each_pair do |src, dest|
    src = engine_root.join(*(src_root + src))
    dest = engine_root.join(*dest)

    Dir.glob(src).each do |src_file|
      dest_file = dest.join(File.basename(src_file))
      FileUtils.cp(src_file, dest_file)
      puts "Copied #{src_file} => #{dest_file}"
    end
  end
end
