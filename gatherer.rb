require 'yaml'
require 'git'

FileUtils.rm_rf 'scratch'
FileUtils.mkdir_p 'scratch'
projects = YAML.load_file('_data/projects.yml').select { |p| p['url'][0] == '/' }

projects.reverse.each do |project|
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
end
FileUtils.rm_r 'scratch'
