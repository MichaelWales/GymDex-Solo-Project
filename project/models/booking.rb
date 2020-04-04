require_relative('../db/sql_runner')
require_relative('./customer')
require_relative('./session')


class Booking

  attr_reader :id, :customer_id, :session_id

  def initialize
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @session_id = options['session_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (
      customer_id,
      session_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@customer_id, @session_id]
    booking = SqlRunner.run(sql, values).first
    @id = booking['id'].to_i
  end

  def customer()
    sql = "SELECT *
    FROM customers
    WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end

  def session()
    sql = "SELECT *
    FROM sessions
    WHERE id = $1"
    values = [@session_id]
    session = SqlRunner.run(sql, values).first
    return Session.new(session)
  end

  def self.map_items(booking_data)
    result = booking_data.map { |booking| Booking.new( booking ) }
    return result
  end

end
