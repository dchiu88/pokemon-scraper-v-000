class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name: , type: , db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

 def self.find(id, db)
    pokemon_found = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_found[0], name: pokemon_found[1], type: pokemon_found[2], db: db)
  end

  def alter_hp(new_hp, database_connection)
     database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
   end



end
