# 09.10.2020

def summarize_driver(nested_hash, driver, value_index)
	# summarize a given parameter for a given driver
	# value index is the index of the item of interest
	# in the ride-specific array per driver
	summary_list = []
	nested_hash[:"#{driver}"].each do |ride|
		value = ride.values[0][value_index]
		summary_list.push(value)
	end
	return summary_list
end

# big ole hash with rider info
driver_hash = { 
	DR0001: [
      {ride_1: ["3rd Feb 2016", 10, "RD0003", 3]},
      {ride_2: ["3rd Feb 2016", 30, "RD0015", 4]},
      {ride_3: ["5th Feb 2016", 45, "RD0003", 2]}
  ],
  DR0002: [
      {ride_1: ["3rd Feb 2016", 25, "RD0073", 5]},
      {ride_2: ["4th Feb 2016", 15, "RD0013", 1]},
      {ride_3: ["5th Feb 2016", 35, "RD0066", 3]}
  ],
	DR0003: [
      {ride_1: ["4th Feb 2016", 5, "RD0066", 5]},
      {ride_2: ["5th Feb 2016", 50, "RD0003", 2]}
  ],
	DR0004: [
      {ride_1: ["3rd Feb 2016", 5, "RD0022", 5]},
      {ride_2: ["4th Feb 2016", 10, "RD0022", 4]},
      {ride_3: ["5th Feb 2016", 20, "RD0073", 5]}
  ]
}


# riders per driver
driver_hash.each_key do |key|
	rides = driver_hash[:"#{key}"].length
	puts "Driver #{key} has #{rides} rides"
end

# total amount of money each driver made
max_earnings = {}
driver_hash.each_key do |key|
	costs = summarize_driver(driver_hash, key, 1)
	max_earnings[:"#{key}"] = costs.sum
end
max_earnings.each { |key, value| puts "Driver #{key} made $#{value}"}

# average rating per driver
avg_ratings = {}
driver_hash.each_key do |key|
	ratings = summarize_driver(driver_hash, key, -1)
	avg_ratings[:"#{key}"] = ratings.sum/ratings.length.to_f
end
avg_ratings.each { |key, value| puts "Driver #{key} had an average rating of #{value.round(1)}"}

# which driver made the most money?
max_earner = max_earnings.max_by{|k,v| v}[0].to_s
puts "Driver #{max_earner} made the most money"

# which driver had highest average rating
max_avg = avg_ratings.max_by{|k,v| v}[0].to_s
puts "Driver #{max_avg} had the highest average rating"


