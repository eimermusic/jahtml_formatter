# coding: UTF-8
module IsoExampleGroupMethods
  def self.included(klass)
    klass.extend ClassMethods
  end
  module ClassMethods
    def description
      if iso_id = metadata.delete(:iso_id)
        metadata[:example_group][:description] = "#{iso_id} #{metadata[:example_group][:description]}"
      end
      super
    end
  end
end