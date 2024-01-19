class CreateEmps < ActiveRecord::Migration[6.1]
  def change
    create_table :emps do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.string :address

      t.timestamps
    end
  end
end
