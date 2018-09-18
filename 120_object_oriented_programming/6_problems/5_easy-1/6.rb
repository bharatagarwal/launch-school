class Flight
  # attr_accessor :database_handle
  # don't provide access to implementation details.

  def initialize(flight_number)
    @database_handle = Database.new
    @flight_number = flight_number
  end
end

