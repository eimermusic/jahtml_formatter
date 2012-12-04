# coding: UTF-8
module IsoExampleMethods
  def description
    if @options.key?(:iso_id)
      ## if the description is empty... we don't do anything
      ## I guess it can be empty if an it is defined like so:
      ## it { should have(5).items } - what then?
      unless metadata[:description].to_s.empty? || metadata[:description].include?(@options[:iso_id])
        metadata[:description] = "#{metadata[:description]}, iso: #{@options[:iso_id]}"
      end
    end
    super
  end
end