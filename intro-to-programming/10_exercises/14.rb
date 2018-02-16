contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contact_data.each do |deet|
  fields.each do |f|
    contacts["Joe Smith"][f] = contact_data.first
    contact_data.shift
  end 
end

p contacts