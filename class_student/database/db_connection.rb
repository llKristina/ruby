require 'pg'

class DBConnection
  @instance = nil

  def self.instance
    @instance ||= new
  end

  def client
    @client ||= PG.connect(
      dbname: 'Students',   
      user: 'postgres',         
      password: '123', 
      host: 'localhost',        
      port: 5432               
    )
  end

  private_class_method :new
end
