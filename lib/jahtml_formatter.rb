require 'erb'
require 'rspec/core/formatters/html_formatter'
require 'jahtml_printer'
require 'iso_example_group_methods'

class JahtmlFormatter < RSpec::Core::Formatters::HtmlFormatter
  def initialize(output)
    super(output)
    @printer = JahtmlPrinter.new(output)
  end
end

RSpec.configure do |config|
  config.include IsoExampleGroupMethods
end