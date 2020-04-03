require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :membership_type, :membership_status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @membership_type = options['membership_type']
    @membership_status = options['membership_status'].to_b
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

end
