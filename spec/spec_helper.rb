require 'jekyll'

RSpec.configure do |config|
  config.before :all do
    FileUtils.rm_rf '../_site'
    Jekyll::Commands::Build.process dir: '../'
  end
end

RSpec::Matchers.define :contain do |expected|
  match do |actual|

    actual = File.read "_site%sindex.html" % actual

    if (expected.contentise - actual.contentise).empty?
      return true
    end

    false
  end

  failure_message do |actual|
    "expected #{actual} to contain #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected #{actual} to not contain #{expected}"
  end

  description do
    'matches file content against expectation'
  end
end

class String
  def contentise
    # split into lines, strip spaces from ends, ding blank lines
    self.strip.split("\n").map { |l| l.strip }.reject { |l| l == '' }
  end
end
