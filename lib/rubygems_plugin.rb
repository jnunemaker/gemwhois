if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.3.6')
  require 'rubygems/command_manager'
  Gem::CommandManager.instance.register_command(:whois)
end