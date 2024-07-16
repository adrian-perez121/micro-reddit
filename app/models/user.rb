class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :user_name, presence: true, length: {
    in: 5..15,
    too_short: "too short (minimum is %{count} characters)",
    too_long: "too long (maximum is %{count} of characters"
  }, uniqueness: true
end
