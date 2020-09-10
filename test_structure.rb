# max earner/highest avg rating should handle ties? are there ties?
# don't use any enumerable methods? (only each_key)


def summarize_driver(nested_hash, driver, value_index)
	# summarize a given parameter for a given driver
	# value index is the index of the item of interest
	# in the ride-specific array per driver
	summary_list = []
	nested_hash[:"#{driver}"].each do |ride|
		# not sure why -1 unnests nested array here.. 
		value = ride.values[-1][value_index]
		summary_list.push(value)
	end
	return summary_list
end

# not fully filled out, just testing
info = { 
	DR0001: [ 
	{ ride_1: ["3rd Feb 2016", 10, "RD0003", 3] },
	{ ride_2: ["3rd Feb 2016", 30, "RD0015", 4] }
			],

	DR0002: [
	{ ride_1: ["3rd Feb 2016", 25, "RD0073", 5] },
	{ ride_2: ["4th Feb 2016", 15, "RD0013", 1] }
]
}


# riders per driver
info.each_key do |key|
	rides = info[:"#{key}"].length
	puts "Driver #{key} has #{rides} rides"
end


# total amount of money each driver made
max_earnings = {}
info.each_key do |key|
	costs = summarize_driver(info, key, 1)
	max_earnings[:"#{key}"] = costs.sum
end

max_earnings.each { |key, value| puts "Driver #{key} made $#{value}"}

# without a method
# info.each_key do |key|
# 	# puts key
# 	costs = []
# 	info[:"#{key}"].each do |ride|
# 		cost = ride.values[-1][1]
# 		# puts cost
# 		costs.push(cost)
# 	end
# 	puts "Driver #{key} made $#{costs.sum}"
# end

# average rating per driver
avg_ratings = {}
info.each_key do |key|
	ratings = summarize_driver(info, key, -1)
	avg_ratings[:"#{key}"] = ratings.sum/ratings.length.to_f
end
avg_ratings.each { |key, value| puts "Driver #{key} had an average rating of #{value}"}


# without a method
# info.each_key do |key|
# 	# puts key
# 	ratings = []
# 	info[:"#{key}"].each do |ride|
# 		rating = ride.values[-1][-1]
# 		# puts rating
# 		ratings.push(rating)
# 	end
# 	avg = ratings.sum/ratings.length.to_f
# 	puts "Driver #{key} had an average rating of #{avg}"
# end

# which driver made the most money?
# this should handle ties...
max_earner = max_earnings.max_by{|k,v| v}[0].to_s
puts "Driver #{max_earner} made the most money"

# which driver had highest average rating
# this should handle ties...
max_avg = avg_ratings.max_by{|k,v| v}[0].to_s
puts "Driver #{max_avg} had the highest average rating"


