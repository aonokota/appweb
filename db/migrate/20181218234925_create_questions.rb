class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :content
      t.text :name
      t.boolean :finished

      t.timestamps
    end
  end
end
