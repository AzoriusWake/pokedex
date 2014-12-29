class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :pkdx_id
      t.string :height
      t.string :weight
      t.string :attack
      t.string :defense
      t.string :speed
      t.string :hp
      t.string :img
      t.timestamps
    end
  end
end