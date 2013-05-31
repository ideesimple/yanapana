class Spree::Faq < ActiveRecord::Base
  attr_accessible :answer, :question, :position
  acts_as_list


end
