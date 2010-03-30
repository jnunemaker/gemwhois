require 'rubygems'
require 'rubygems/command_manager'
require 'rubygems/commands/whois'
require 'crack'
require 'unindent'

Gem::CommandManager.instance.register_command(:whois)