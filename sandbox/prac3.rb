PRODUCTS = [
  { name: "Thinkpad x210", price: 250 },
  { name: "Thinkpad x212", price: 979 },
  { name: "Thinkpad x213", price: 350 },
  { name: "Thinkpad x210", price: 700 },
  { name: "Thinkpad x2", price: 260 },
  { name: "Macbook Air", price: 600 },
  { name: "Macbook Pro", price: 900 },
  { name: "Dell Latitude", price: 400 },
  { name: "Dell Latitude", price: 650 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: "dell"
}

def search(query)
  PRODUCTS.select do |product|
    (query[:price_min]..query[:price_max]).include?(product[:price]) && product[:name].downcase.include?(query[:q])
  end
end

p search(query)
p search(query2)