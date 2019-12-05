class Referral < ApplicationRecord
  belongs_to :user, foreign_key: :referrer, foreign_key: :referred
end
