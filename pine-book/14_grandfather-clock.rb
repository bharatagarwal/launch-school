def grandfather_clock &block
  hour = if Time.new.hour == 0
          12
        else
          Time.new.hour % 12
        end

  hour.times(&block)
end

grandfather_clock { puts 'DONG!'}