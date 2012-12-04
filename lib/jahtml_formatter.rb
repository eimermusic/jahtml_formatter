require 'erb'
require 'rspec/core/formatters/html_formatter'
require 'jahtml_printer'
require 'iso_example_group_methods'
require 'iso_example_methods'
require 'rspec/core'

class JahtmlFormatter < RSpec::Core::Formatters::HtmlFormatter
  def initialize(output)
    super(output)
    @printer = JahtmlPrinter.new(output)
  end
end

RSpec.configure do |config|
  config.include IsoExampleGroupMethods
  config.before do
    example.extend IsoExampleMethods
  end
end