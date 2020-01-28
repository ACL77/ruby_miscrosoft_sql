# This class maps the object world / logic layer with the DB world / Data layer

class Player
  attr_reader :id # id is only readable
  attr_accessor :name, :position, :club # name, position and club are readable and writable

  # runs when Player.new is called
  # initializes the instance variables
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @position = attributes[:position]
    @club = attributes[:club]
  end

  # class method to find a player given an id
  def self.find(id)
    results = DB.execute("SELECT * FROM players WHERE players.id = #{id}")
    if results == []
      nil
    else
      player_data = results.first
      Player.new(id: player_data["id"].to_i,
               name: player_data["name"],
               position: player_data["position"],
               club: player_data["club"])
    end
  end

  # class method to return all players
  def self.all
    results = DB.execute("SELECT * FROM players")
    results.map do |result|
      Player.new(id: result["id"].to_i,
               name: result["name"],
               position: result["position"],
               club: result["club"])
    end
  end

  # instance method to delete an instance
  def destroy
    DB.execute("DELETE FROM players WHERE id = #{@id}")
  end

  # instance method to save an intance
  def save
    @id.nil? ? create : update
  end

  private

  def update
    DB.execute("UPDATE players SET name = '#{@name}', position = '#{@position}', club = '#{@club}' WHERE id = #{@id}")
  end

  def create
    result = DB.execute("INSERT INTO players (name, position, club) VALUES ('#{@name}', '#{@position}', '#{@club}')")
    @id = result.insert # last inserted row id
  end
end
