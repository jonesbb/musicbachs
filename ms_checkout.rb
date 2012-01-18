#!/usr/bin/env ruby
#
#
#############
# created 1/15/2012 by Byron Jones
# test script for using meta-spotify
# https://github.com/philnash/meta-spotify
#
#
require 'rubygems'
require 'meta-spotify'
require 'httparty'


#require 'mechanize'
#require 'hpricot'
#require 'open-uri'
#require 'net/smtp'
#require 'mail'

END {
puts "\n<<program fin>>"
}


# this prints out entire list of artists and all metadata
search_term = 'foo'
results = MetaSpotify::Artist.search(search_term)
#results = MetaSpotify::Artist.search(search_term, :page => 2)

arts = results.keys

## These work to print query info...
   #print "Artists          : ", results[:artists], "\n\n"
   #print "Query            : ", results[:query], "\n"
   #print "Items Per page   : ", results[:items_per_page], "\n"
   #print "Start Index      : ", results[:start_index], "\n"
   #print "Total Results    : ", results[:total_results], "\n\n"

#puts results

items_per_page = results[:items_per_page]
starting_item  = results[:start_index]

#Find out how many pages of results there are
quantity = results[:total_results]
pages = (quantity.to_f/items_per_page).ceil

print "There are #{quantity} results for Artist search \"#{search_term}\".\n"

#print "Showing #{starting_item} through #{items_per_page} of #{pages} pages.\n"
#results[:artists].each{|i| puts i.name}

if pages == 1 then
   print "Showing #{quantity} results for Artist search \"#{search_term}\".\n"
   results[:artists].each{|i| puts i.name}
end

if pages > 1 then
   (1...pages+1).each do |k|
   results2 = MetaSpotify::Artist.search(search_term, :page => k)
   starting_item2  = results2[:start_index]
   print "Showing page #{k}: next #{items_per_page} results, starting with #{starting_item2}\n"
   end
end


