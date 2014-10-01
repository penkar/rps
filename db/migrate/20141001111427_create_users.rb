class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |g|
    	g.string :username
    	g.string :email
    	g.integer :wins
    	g.integer :losses
    	g.integer :ties
    	g.integer :total_games
    end
  end
end
