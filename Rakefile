require 'yaml'
require 'git'
require 'html-proofer'

desc 'Run HTML-proofer tests'
task :test do
  sh 'bundle exec jekyll build'
  ignore = [ 'blog/' ]
  HTML::Proofer.new('./_site',
                    validate_html: true,
                    ssl_verifypeer: false,
                    timeout: 30,
                    favicon: true,
                    disable_external: true
                    ).run
end

namespace :projects do
  desc 'collect and format project READMEs'
  task :gather do
    FileUtils.rm_rf 'scratch'
    FileUtils.mkdir_p 'scratch'
    projects = YAML.load_file('_data/projects.yml').select { |p| p['url'][0] == '/' }

    projects.each do |project|
      print "Gathering README for #{project['title']}... "
      gh = "https://github.com/#{project['github']}"
      path = "scratch/#{project['github'].split('/')[-1]}"
      g = Git.clone gh, path

      readme = File.readlines "#{path}/README.md"
      i = readme.index { |i| i.match /^#[^#]/ }
      readme = readme[i + 1..-1]
      readme.shift if readme[0] == "\n"

      out = File.open "#{project['url'][1..-1]}.md", 'w'
      out.write "---\n"
      out.write "title: #{project['title']}\n"
      out.write "github: #{project['github']}\n"
      out.write "---\n"

      readme.each { |l| out.write l }

      out.close
      puts 'done'
    end
    FileUtils.rm_r 'scratch'
  end
end

task :default => [:test]
