module Helpers
  module Output
    def assert_output(expected, &block)
      keep_stdout do |stdout|
        block.call
        if expected.is_a?(Regexp)
          assert_match expected, stdout.string
        else
          assert_equal expected.to_s, stdout.string
        end
      end
    end

    def keep_stdout(&block)
      begin
        orig_stream, $stdout = $stdout, StringIO.new
        block.call($stdout)
      ensure
        s, $stdout = $stdout.string, orig_stream
        s
      end
    end
  end
end