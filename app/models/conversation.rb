class Conversation < ActiveRecord::Base
  has_many :messages
  belongs_to :user
  validates_uniqueness_of :partner_id, :scope => :user_id

def self.between(first, second)
where("(user_id = ? and partner_id = ?) or (user_id = ? and partner_id = ?)",first, second, second, first)
end

end
