require 'net/http'
require 'json'
require 'byebug'

require 'pg'

class User
  attr_accessor :id, :name, :email, :created_at, :updated_at

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @genre = hash[:email]
    @created_at = hash[:created_at]
    @updated_at = hash[:updated_at]
  end

  def self.all
    users = fetch_users
    users.map {|user| new(user) }
  end

  def self.fetch_users

    begin
      conection = PG.connect(dbname: 'frankcalendar_development', host: 'db',
                             user: 'postgres', password: 'postgres')

      lines = conection.exec('SELECT * FROM users')

      lines.map do |line|
        {
          id: line['id'],
          name: line['name'],
          genre: line['email'],
          created_at: line['created_at'],
          updated_at: line['updated_at']
        }
      end

    rescue => exception
      puts e.message

    ensure
      conection.close if conection
    end
  end

end
