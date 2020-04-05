require_relative('../db/sql_runner')
require_relative('./session')

class Customer

  attr_reader :id
  attr_accessor :name, :membership_type, :membership_status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @membership_type = options['membership_type']
    @membership_status = options['membership_status']
  end

  def create_member()
    sql = "INSERT INTO customers
    (
      name,
      membership_type,
      membership_status
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @membership_type, @membership_status]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all_members()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map {|result| Customer.new(result)}
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def update_member_name()
    sql = "UPDATE customers SET
    name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def update_membership_type()
    sql = "UPDATE customers SET
    membership_type = $1
    WHERE id = $2"
    values = [@membership_type, @id]
    SqlRunner.run(sql, values)
  end

  def update_membership_status()
    sql = "UPDATE customers SET
    membership_status = $1
    WHERE id = $2"
    values = [@membership_status, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def sessions()
    sql = "SELECT sessions.*
    FROM sessions
    INNER JOIN bookings
    ON bookings.session_id = sessions.id
    WHERE customer_id = $1"
    values = [@id]
    session_data = SqlRunner.run(sql, values)
    return Session.map_items(session_data)
  end

  def membership_check?()
    if @membership_type == "Premium"
      return true
    else
      false
    end
  end

  def active_member()
    if @membership_status == 't'
      return "Active"
    else
      "Deactivated"
    end
  end

  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new( customer ) }
    return result
  end

end
