class CreateSpreeFaqs < ActiveRecord::Migration
  def change
    create_table :spree_faqs do |t|
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
