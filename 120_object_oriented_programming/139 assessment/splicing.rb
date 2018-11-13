# You have an application that uses a #fetch method to retrieve a collection of data from some external source and a #save method that saves any modified data when you finish. 

# To make updates easier, you have several methods that update the data based on different search criteria. So far, you have something like this:


def update_data(select_string)
  data = fetch(select_string)
  data.each # you can update or replace this line of code
  save(data)
end

def update_by_type(type) # you can update this method
  update_data("employee_type = #{type}")
end

def update_by_location(location) # you can update this method
  update_data("employee_location = #{location}")
end

# Example calls - do not modify these lines
update_by_type("Manager") do |employee|
  employee.salary *= 1.25
end

update_by_location("Oregon") do |employee|
  employee.salary *= 1.10
end

# You want to use the #each method in #update_data rather than write an explicit loop, but this means that you somehow need to pass a block through two different methods before you can invoke it. A simple yield won't work in this case.

# Finish implementing the #update_data, #update_by_type, and #update_by_location methods.