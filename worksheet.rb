########################################################
# Step 1: Establish the layers

# Question:
# 1. In this section of the file, as a series of comments,
# create a list of the layers you identify.
# 2. Which layers are nested in each other?
# 3. Which layers of data "have" within it a different layer?
# 4. Which layers are "next" to each other?

# Answers:
# 1. drivers, rides per driver, possibly details of each ride
# (date, cost, rider id, rating)
# 2. rides are driver specific and the information about each
# ride is ride-specific
# 3. ride information is nested by driver id, and within this,
# ride information could be nested by ride number
# 4. for a given driver, the ride information for each ride
# will be in the same layer

########################################################
# Step 2: Assign a data structure to each layer

# Question:
# Copy your list from above, and in this section
# determine what data structure each layer should have

# Answer:
# Layers - drivers, rides per driver, possibly details of each ride
# (date, cost, rider id, rating)
# All driver info can be stored in a large hash
# where each key will correspond to a driver, and each value
# will be an array of hashes. With this array of hashes,
# Each hash will have ride-specific information
# where the keys indicate the ride number, and the value is an array
# with the date, cost, rider id, and rating of that ride

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"
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

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

def summarize_driver(nested_hash, driver, value_index)
  # summarize a given parameter for a given driver
  # value index is the index of the item of interest
  # in the ride-specific array per driver
  return nested_hash[:"#{driver}"].map{|ride| ride.values[0][value_index]}
end

# the number of rides each driver has given
driver_hash.map {|k, v| puts "Driver #{k} gave #{v.length} rides"}

# the total amount of money each driver has made
max_earnings = {}
driver_hash.each_key do |key|
  costs = summarize_driver(driver_hash, key, 1)
  max_earnings[:"#{key}"] = costs.sum
end
max_earnings.each { |key, value| puts "Driver #{key} made $#{value}"}

# the average rating for each driver
avg_ratings = {}
driver_hash.each_key do |key|
  ratings = summarize_driver(driver_hash, key, -1)
  avg_ratings[:"#{key}"] = ratings.sum/ratings.length.to_f
end
avg_ratings.each { |key, value| puts "Driver #{key} had an average rating of #{value.round(1)}"}

# Which driver made the most money?
max_earner = max_earnings.max_by{|k,v| v}[0].to_s
puts "Driver #{max_earner} made the most money"

# Which driver has the highest average rating?
max_avg = avg_ratings.max_by{|k,v| v}[0].to_s
puts "Driver #{max_avg} had the highest average rating"

# Optional: For each driver, on which day did they make the most money?
# driver_hash.each_key do |key|
#   date_hash = {}
#   driver_hash[:"#{key}"].each do |ride|
#     date = ride.values[0][0]
#     # this breaks if they have more than one ride on the same day
#     date_hash[:"#{date}"] = ride.values[0][1]
#   end
#   puts "Driver #{key} earned the most money on #{date_hash.max_by{|k, v| v}[0].to_s}"
# end
