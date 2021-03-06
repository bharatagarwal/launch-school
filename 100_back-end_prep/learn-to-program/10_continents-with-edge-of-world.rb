M = 'land'
o = 'water'
          #0,1,2,3,4,5,6,7,8,9,10
world = [ [o,o,o,o,o,o,o,o,o,o,o],#0
          [o,o,o,o,M,M,o,o,o,o,o],#1
          [o,o,o,o,o,o,o,o,M,M,o],#2
          [o,o,o,M,o,o,o,o,o,o,o],#3
          [o,o,o,M,o,M,M,o,o,o,o],#4
          [o,o,o,o,M,M,M,M,o,o,o],#5
          [o,o,o,M,M,M,M,M,M,M,o],#6
          [o,o,o,M,M,o,M,M,M,o,o],#7
          [o,o,o,o,o,o,M,M,o,o,o],#8
          [o,M,o,o,o,M,o,o,o,o,o],#9
          [o,o,o,o,o,o,o,o,o,o,o]]#10

def continent_size world, x, y

  if x < 0 or x > (world[0].length - 1) or y < 0 or y > (world.length - 1)
    puts "You'll fall off the edge of the world!"
  else
    if world[y][x] != 'land'
      return 0
    end

    size = 1
    world[y][x] = 'counted land'

    size += continent_size(world, x-1, y-1)

    size += continent_size(world, x, y-1)

    size += continent_size(world, x+1, y-1)

    size += continent_size(world, x-1, y)

    size += continent_size(world, x+1, y)

    size += continent_size(world, x-1, y+1)

    size += continent_size(world, x, y+1)

    size += continent_size(world, x+1, y+1)

    size
  end
end

puts continent_size(world, 5, 5)
