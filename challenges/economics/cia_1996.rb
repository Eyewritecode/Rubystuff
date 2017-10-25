require 'nokogiri'

doc = File.open("cia-1996.xml")
classified = Nokogiri::XML(doc)
population = 0
country_name = ""
countries = []
inflations = {}
countries_by_continent = Hash.new {|hash, key| hash[key] = []}
classified.xpath("//country").each do |country|

	if country["population"].to_i > population
		population = country["population"].to_i
		country_name = country["name"]
	end
	inflations[country["name"]] = country["inflation"] ? country["inflation"].to_f : 0.0
	countries_by_continent[country["continent"]] << country["name"]
end
puts("*********************************\n")
puts("#{country_name} had the highest population of #{population}\n")
puts("*********************************\n")
puts("the top 5 countries with the highest inflation rate were: \n")
sorted = inflations.sort_by {|k,v| v}
Hash[sorted[-5..-1]].reverse_each do |k, v|
	puts("#{k}: #{v}")
end
puts("*********************************\n")
puts("The world's continent according to CIA report 1996: \n")
puts(countries_by_continent.keys)
puts("*********************************\n")
puts("Countries by continent\n")
countries_by_continent.each do |k, v|
	puts("\n#{k}:\n\n".upcase)
	puts("*********************************\n")
	v.each do |c|
		puts("#{c}")
	end
	puts("\n*********************************\n")
end