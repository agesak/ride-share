########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

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
  summary_list = []
  nested_hash[:"#{driver}"].each do |ride|
    value = ride.values[0][value_index]
    summary_list.push(value)
  end
  return summary_list
end

# the number of rides each driver has given
driver_hash.each_key do |key|
  rides = driver_hash[:"#{key}"].length
  puts "Driver #{key} has #{rides} rides"
end

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