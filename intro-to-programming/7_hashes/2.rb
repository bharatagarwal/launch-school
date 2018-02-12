#  What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.

hometown = {bharat: 'Delhi', agni: 'Bangalore'}
hometown2 = {bharat: 'Gurgaon', chetan: 'Mumbai'}

# merge returns hash, but non-destructively
combined_hometowns = hometown.merge(hometown2)
p combined_hometowns

# merge! combines destructively
p hometown
p hometown.merge!(hometown2)

