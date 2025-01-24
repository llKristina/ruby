require 'pg'

class DBConnection
  DB_PARAMS = {
    dbname: 'Students',
    user: 'postgres',
    password: '123',
    host: 'localhost',
    port: 5432
  }

  private_class_method :new

  def self.instance
    @instance ||= new
  end

  def initialize
    @conn = PG.connect(DB_PARAMS)
  end

  def exec_params(query, params = [])
    @conn.exec_params(query, params)
  end
  
  def exec_query(query)
    @conn.exec(query)
  end

  def close
    @conn.close
  end
end
