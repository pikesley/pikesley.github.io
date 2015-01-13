require 'html/proofer'

task :test do
  sh 'bundle exec jekyll build'
  HTML::Proofer.new('./_site',
                    validate_html: true,
                    ssl_verifypeer: false,
                    timeout: 30).run
end

task :default => [:test]
