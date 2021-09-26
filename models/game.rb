require 'net/http'
require 'json'
require 'byebug'

require 'pg'

class Game
  attr_accessor :id, :name, :genre, :created_at, :updated_at

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @genre = hash[:genre]
    @created_at = hash[:created_at]
    @updated_at = hash[:updated_at]
  end

  def self.all
    games = fetch_games
    games.map {|game| new(game) }
  end

  def self.fetch_games

    begin
      conection = PG.connect(dbname: 'hello_development', host: 'db',
                             user: 'postgres', password: 'postgres')

      lines = conection.exec('SELECT * FROM games')

      lines.map do |line|
        {
          id: line['id'],
          name: line['name'],
          genre: line['genre'],
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
