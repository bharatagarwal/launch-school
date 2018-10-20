def test
  output = <<~OUTPUT
  ---- Today's Todos ----
  [ ] Buy milk
  [ ] Clean room
  [ ] Go to gym
  OUTPUT

  p output == output.gsub(/^\s+/, "")
end

test