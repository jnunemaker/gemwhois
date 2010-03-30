require 'helper'

class TestGemwhois < Test::Unit::TestCase
  context 'Whois for found gem' do
    setup do
      @gem = 'httparty'
      stub_gem(@gem)
      @command = Gem::Commands::WhoisCommand.new
      @command.handle_options([@gem])
    end

    should "work" do
      output = <<-STR.unindent

        gem name: httparty
          owners: John Nunemaker, Sandro Turriate
            info: Makes http fun! Also, makes consuming restful web services dead easy.
         version: 0.5.2
       downloads: 40707

      STR
      assert_output(output) { @command.execute }
    end
  end
  
  context "Whois for missing gem" do
    setup do
      @gem = 'missing'
      stub_gem(@gem, :status => ["404", "Not Found"])
      @command = Gem::Commands::WhoisCommand.new
      @command.handle_options([@gem])
    end

    should "work" do
      output = <<-STR.unindent

        Gem not found. It will be mine. Oh yes. It will be mine. *sinister laugh*

      STR
      assert_output(output) { @command.execute }
    end
  end
end
