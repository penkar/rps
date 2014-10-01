class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |g|
    	g.string :status
    	g.belongs_to :user
    	g.string :movep1
    	g.belongs_to :user
    	g.string :movep2
    	g.string :victor
    end
  end
end
