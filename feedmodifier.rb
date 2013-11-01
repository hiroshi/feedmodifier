require 'nokogiri'

def feed(input)
  doc = Nokogiri::XML(input){|x| x.noblanks }
  doc.xpath("//item").each do |item_node|
    if item_node.xpath("guid").empty?
      guid_node = Nokogiri::XML::Node.new("guid", doc)
      guid_node.content = item_node.at_xpath("comments").content
      item_node.add_child(guid_node)
    end
  end
  doc.to_xml(:indent => 2)
end


if $0 == __FILE__
  puts feed(ARGF)
end
