class CreateProblemUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :problem_users do |t|
      t.references :problem, foreign_key: true
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
