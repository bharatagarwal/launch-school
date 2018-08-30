require 'parser/current'
code = File.read('07_rubocop_experiment.rb')
parsed_code = Parser::CurrentRuby.parse(code)
puts parsed_code
