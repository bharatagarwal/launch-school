module Walk
end

module Swim
end

class Animal
end

class Vertebrates < Animal
end

class Mammals < Vertebrates
  include Walk
  include Swim
end

p Mammals.ancestors