#!/usr/local/bin/ruby

require 'rubygems'
require 'open-uri'
require 'hpricot'

def main
    ytalent_url = 'http://talent.yahoo.co.jp/pf/profile/pp'

    for i in 1..99999
        crawl_url = ytalent_url + i.to_s
        begin
            parsed_html = Hpricot(open(crawl_url))
            parsed_html.search("#detail table tr") {|tbl|
                puts tbl.at("th").inner_text.chomp + ": " + tbl.at("td").inner_text.chomp
            }
        rescue Timeout::Error, StandardError => exc
            puts exc
        end
        puts "-----"
        sleep(1)
    end
end

main

