class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :slug
      t.datetime :published_at
      t.string :header
      t.text :text
      t.text :image_data
      t.text :audio_data
      t.timestamps
    end
    add_index :episodes, :slug, unique: true
  end
end
