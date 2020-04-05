require_relative('../db/sql_runner')
require_relative('./customer')

class Session

  attr_reader :id
  attr_accessor :name, :starting_time, :type, :status, :max_capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @starting_time = options['starting_time']
    @type = options['type']
    @status = options['options']
    @max_capacity = options['max_capacity'].to_i
  end

  def create_session()
    sql = "INSERT INTO sessions
    (
      name,
      starting_time,
      type,
      status,
      max_capacity
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @starting_time, @type, @status, @max_capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all_sessions()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run(sql)
    return results.map {|result| Session.new(result)}
  end

  def self.find(id)
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Session.new(results.first)
  end

  def update_session_details()
    sql = "UPDATE sessions SET
    (
      name,
      starting_time,
      type,
      max_capacity
    )
    =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@name, @starting_time, @type, @max_capacity, @id]
    SqlRunner.run(sql, values)
  end

  def update_session_status()
    sql = "UPDATE sessions SET
    status = $1
    WHERE id = $2"
    values = [@status, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN bookings
    ON bookings.customer_id = customers.id
    WHERE session_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Customer.map_items(customer_data)
  end

  def session_size()
    customers().size()
  end

  def session_at_max?()
    session_size() >= @max_capacity
  end

  def peak_time?()
    if @starting_time >= "17:00:00" && @starting_time <= "21:00:00"
      return true
    else
      false
    end
  end

  def self.map_items(session_data)
    result = session_data.map { |session| Session.new( session ) }
    return result
  end

end
