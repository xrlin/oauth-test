class AddGithubInfoToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :github
    end
  end
end
