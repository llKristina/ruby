require 'pg'

class DBConnection
  def self.client
    @client ||= PG.connect(
      dbname: 'Students',   
      user: 'postgres',       
      password: '123', 
      host: 'localhost',      
      port: 5432               
    )
  end
end
