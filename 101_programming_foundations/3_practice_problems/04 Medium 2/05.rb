def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end


# can be simplified to

def color_valid(color)
  color == "blue" || color == "green"
end
