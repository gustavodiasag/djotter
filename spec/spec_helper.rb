require "rspec"

if ENV.fetch("DEBUG", false)
  require "amazing_print"
  require "debug"

end

RSpec.configure do |config|
  config.fail_if_no_examples = true

  def parse_tests(path)
    lines = File.readlines(path, chomp: true, encoding: "utf-8").to_enum
    tests = []

    begin
      loop do
        lines.next until lines.peek.match(/^```/)

        start = lines.next
        match = start.match(/^(`+)\s*(.*)/)

        raise "Test start line did not have expected form." unless match

        ticks = Regexp.new("^#{match[1]}")

        inp = ""
        while (line = lines.next) && !line.match(/^[.!]$/)
          inp += line + "\n"
        end

        exp = ""
        while (line = lines.next) && !line.match(ticks)
          exp += line + "\n"
        end

        tests << {inp: inp, exp: exp}
      end

    rescue StopIteration
    end

    tests
  end
end
