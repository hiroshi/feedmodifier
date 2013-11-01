require 'nokogiri'

def feed(input)
  doc = Nokogiri::XML(input){|x| x.noblanks }
  doc.to_xml(:indent => 2)
end


if $0 == __FILE__
  puts feed(ARGF)
end
