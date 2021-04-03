dial_book = {
  "newyork" => "212",
  "newbrunswick" => "732",
  "edison" => "908",
  "plainsboro" => "609",
  "sanfrancisco" => "301",
  "miami" => "305",
  "paloalto" => "650",
  "evanston" => "847",
  "orlando" => "407",
  "lancaster" => "717"
}
 
def get_city_names(somehash)
  somehash.each do |key,value|
    p "There is a city with the name of #{key}"
  end 
end
 
# Get area code based on given hash and key
def get_area_code(somehash, key)
  if somehash.key?(key)
    return "The are code for #{key} is #{somehash[key]}"
  end 
  "We don't have any information on #{key}"
end 
 
# # Execution flow
# loop do
# # Write your program execution code here
# end


# get_city_names(dial_book)
p get_area_code(dial_book,"newyork")