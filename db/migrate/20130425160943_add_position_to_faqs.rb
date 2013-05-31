class AddPositionToFaqs < ActiveRecord::Migration
  def change
    add_column :spree_faqs, :position, :integer
  end
end
