require_relative('../db/sql_runner')

class Session

  attr_reader :id
  attr_accessor :name, :starting_time, :type, :status, :max_capacity, :current_capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @starting_time = options['starting_time']
    @type = options['type']
    @status = options['options'].to_s
    @max_capacity = options['max_capacity'].to_i
    @current_capacity = options['current_capacity'].to_i
  end

  def create_session()
    sql = "INSERT INTO sessions
    (
      name,
      starting_time,
      type,
      status,
      max_capacity,
      current_capacity
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @starting_time, @type, @status, @max_capacity, @current_capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def method_name

  end

end
