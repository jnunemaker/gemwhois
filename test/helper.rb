require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fakeweb'
require 'mocha'
require 'helpers/output'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'gemwhois'

FakeWeb.allow_net_connect = false

class Test::Unit::TestCase
  include Helpers::Output

  def stub_gem(gem_name, options={})
    FakeWeb.register_uri(:get, "https://rubygems.org/api/v1/gems/#{gem_name}.json", options.merge(:body => fixture_file(gem_name)))
  end

  def fixture_file(gem_name)
    File.read(File.join(File.dirname(__FILE__), 'fixtures', "#{gem_name}.json"))
  end
end