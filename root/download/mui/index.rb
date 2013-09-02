#!/usr/bin/env ruby

require 'cgi'
require '../../include/parts'

def html_items_inmui
  cont = ""
  x = Dir.entries(".").each.to_a.sort do |a, b| a.to_s <=> b.to_s end
  cont += "<div class=\"mui_item\">"
  cont += "<table summary=\"Directory Listing\" cellpadding=\"0\" cellspacing=\"10\" border=\"0\" width=\"1000\">"
  cont += "<thread><tr><td class=\"n\" style=\"font-size:18px;\"><b>Name</b></td><td class=\"m\" style=\"font-size:16px;\"><b>Last Modified Time</b></td></tr></thread>"
  x.collect do |a|
    if (a != '.' && a != '..' && a != 'index.rb')
      cont += "<tr><td class=\"n\"><a href=\"#{a}\">#{a}</a></td> <td class=\"m\">#{File.mtime(a)} </td></tr>"
    end
  end
  cont += "</table>"
  cont += "</div>"
  return cont
end



cont = <<EOF
#{html_header "Development"}
<h1>\> <a href="../..">HomePage</a> \> <a href="..">download</a> \> <a href=".">mui </a> </h1>
#{html_items_inmui}

#{html_tail}
EOF

cgi = CGI.new
cgi.out {
  cont
}


