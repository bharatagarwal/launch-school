def diamond(number)
  stars = 1

  while stars < number
    print  ' ' * ((number - stars) / 2)
    puts '*' * stars
    stars += 2
  end


  while stars >= 1
    print  ' ' * ((number - stars) / 2)
    puts '*' * stars
    stars -= 2
  end
end

diamond(5)
diamond(9)