class List < ApplicationRecord
  belongs_to :group

  validates presence: true
end
