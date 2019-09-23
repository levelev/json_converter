require "json"
file = File.open "familienrecht.json"
data = JSON.load(file)

# data.each do |key, value|
# 	# p key
# 	value.each do |key, value|
# 		value["bottom_ads"].each do |ad|
# 			p ad["link"]
# 		end
# 		value["top_ads"].each do |ad|
# 			p ad["link"]
# 		end
# 	end
# end
p data.class
ads = []

data["results"].each do |key, value|
	value.each do |key, value|
		value["bottom_ads"].each do |ad|
			ads << ad["link"] 
		end
		value["top_ads"].each do |ad|
			ads << ad["link"]
		end
	end
end

p "#{ads.size} ads found:"
ads.each do |ad|
	p ad
end

IO.write("ads.txt", ads.join("\n"))
