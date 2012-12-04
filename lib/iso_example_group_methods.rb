# coding: UTF-8
module IsoExampleGroupMethods
  def self.included(klass)
    klass.extend ClassMethods
  end
  module ClassMethods
    ## why so ugly? - this basically says
    ## that the same iso_id can only appear ONCE
    ## that may or may not be correct
    @@__defined_iso_tags = Hash.new
    def description
      if iso_id = metadata.delete(:iso_id)
        unless @@__defined_iso_tags.key?(iso_id)
          metadata[:example_group][:description] = "#{metadata[:example_group][:description]}, iso: #{iso_id}"
          @@__defined_iso_tags[iso_id] = true
        end
      end
      super
    end
  end
end