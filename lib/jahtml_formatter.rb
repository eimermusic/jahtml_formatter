require 'erb'
require 'rspec/core/formatters/html_formatter'
require 'jahtml_printer'
#require 'iso_example_group_methods'
#require 'iso_example_methods'
#require 'rspec/core'

class JahtmlFormatter < RSpec::Core::Formatters::HtmlFormatter
  def initialize(output)
    super(output)
    @printer = JahtmlPrinter.new(output)
  end
end

## This is not needed really, in rspec you can do this:
## describe MyClass, 'iso: 1.2.3.4' do
##    subject { described_class.new }
##    it "does something, iso: 1.2.3.5" do
##        subject.do_something.should be_true
##    end
## end
## so - patching rspec isn't necessary and could of course
## be harmful to development if there are bugs with future
## rspec versions

#RSpec.configure do |config|
#  config.include IsoExampleGroupMethods
#  config.before do
#    example.extend IsoExampleMethods
#  end
#end