require_relative('../db/sql_runner')


class Booking

  attr_reader :id
  attr_accessor :customer_id, :session_id

  def initialize(options)
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

  def customer_name()
    customer = customer()
    customer.name
  end

  def session()
    sql = "SELECT *
    FROM sessions
    WHERE id = $1"
    values = [@session_id]
    session = SqlRunner.run(sql, values).first
    return Session.new(session)
  end

  def session_name()
    session = session()
    session.name
  end

  def self.all_bookings()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    return results.map {|result| Booking.new(result)}
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.map_items(booking_data)
    result = booking_data.map { |booking| Booking.new( booking ) }
    return result
  end

end
