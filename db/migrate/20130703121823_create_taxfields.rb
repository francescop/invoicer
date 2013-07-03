class CreateTaxfields < ActiveRecord::Migration
  def change
    create_table :taxfields do |t|
      t.string :taxtype
      t.string :title
      t.float :amount

      t.timestamps
    end
  end
end
