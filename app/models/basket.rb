class Basket < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :process, presence: true
  validates :sales_date, presence: true
  validates :stock, presence: true
  
  scope :in_basket_order, -> (user_id) {
    joins(:user).where(user_id: user_id).order(:in_basket_at)
  }

end
