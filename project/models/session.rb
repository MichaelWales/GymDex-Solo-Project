require_relative('../db/sql_runner')

class Session

  attr_reader :id
  attr_accessor :name, :starting_time, :type, :status, :max_capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @starting_time = options['starting_time']
    @type = options['type']
    @status = options['options']
    @max_capacity = options['max_capacity']
  end

  

end
