# Queues follow a first-in-first-out (FIFO) order.

def hello
  if this
    thend
  end
end


# data can only be inserted at the end of a queue

# [.] <-
# [.] [*] <-
# [.] [*] [#] <-

# data can only be read from the front of a queue

# ([.]) [*] [#]

# data can only be removed from the front of a queue

# ..... [*] [#]

# insert 5
# => [5]

# insert 9
# => [5] [9]

# insert 100
# => [5] [9] [100]

# remove
# => [9] [100]

# remove
# => [100]

class PrintManager
  def initialize
    @queue = []
  end

  def queue_print_job(document)
    @queue.push document
  end

  def run
    while @queue.any?
      puts @queue.shift
    end
  end
end

