class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name: , type: , db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

 def self.find(id, db)
    pokemon_found = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_found[0], name: pokemon_found[1], type: pokemon_found[2], db: db)
  end

  def alter_hp(new_hp, db)
    @hp = new_hp
    sql = <<-SQL
      UPDATE pokemon
      SET hp = ?
      WHERE name = ?
    SQL

    db.execute(sql,@hp,self.name)
    # binding.pry
    # "test"
  end

end
