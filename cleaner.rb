require 'URI'

links = []
domains = []

File.readlines('links.txt').each { |line| links << line.strip }
p links
links.each do |link|
	uri = URI.parse(link)
	domains << uri.host
end

domains = domains.uniq


IO.write("domains.txt", domains.join("\n"))