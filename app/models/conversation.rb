class Conversation < ActiveRecord::Base
  has_many :messages
  belongs_to :user
  validates_uniqueness_of :partner_id, :scope => :user_id
end
