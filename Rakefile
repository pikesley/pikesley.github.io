require 'html/proofer'

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

task :default => [:test]
