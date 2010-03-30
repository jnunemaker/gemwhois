require 'rubygems/gemcutter_utilities'

class Gem::Commands::WhoisCommand < Gem::Command
  include Gem::GemcutterUtilities

  def description
    'Perform a whois lookup based on a gem name so you can see if it is available or not'
  end

  def arguments
    "GEM       name of gem"
  end

  def usage
    "#{program_name} GEM"
  end

  def initialize
    super 'whois', description
  end

  def execute
    whois get_one_gem_name
  end

  def whois(gem_name)
    response = rubygems_api_request(:get, "api/v1/gems/#{gem_name}.json") do |request|
      request.set_form_data("gem_name" => gem_name)
    end

    with_response(response) do |resp|
      json = Crack::JSON.parse(resp.body)
      puts <<-STR.unindent

        gem name: #{json['name']}
          owners: #{json['authors']}
            info: #{json['info']}
         version: #{json['version']}
       downloads: #{json['downloads']}

      STR
    end
  end

  def with_response(resp)
    case resp
    when Net::HTTPSuccess
      block_given? ? yield(resp) : say(resp.body)
    else
      if resp.body == 'This rubygem could not be found.'
        puts '','Gem not found. It will be mine. Oh yes. It will be mine. *sinister laugh*',''
      else
        say resp.body
      end
    end
  end
end