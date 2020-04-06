class AddTeamIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :team, foreign_key: true, index: true, after: :body
  end
end
