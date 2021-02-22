class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :currency

  with_options presence: true do
    validates :name
    validates :price, numericality: true
  end
  validates :currency_id, numericality: { other_than: 0 }

  def number
    @number = self.users.length
  end

end
