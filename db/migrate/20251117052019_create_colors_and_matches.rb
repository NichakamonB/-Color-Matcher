class CreateColorsAndMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :colors do |t|
      t.string :name, null: false, limit: 50
      t.string :hex_code, null: false, limit: 7
      t.integer :rgb_r, null: false
      t.integer :rgb_g, null: false
      t.integer :rgb_b, null: false
      t.timestamps
    end

    create_table :color_matches do |t|
      t.references :color1, null: false, foreign_key: { to_table: :colors, on_delete: :cascade }
      t.references :color2, null: false, foreign_key: { to_table: :colors, on_delete: :cascade }
      t.decimal :match_score, precision: 5, scale: 2, null: false
      t.timestamps
    end
  end
end
