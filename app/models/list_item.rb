class ListItem < ApplicationRecord
  belongs_to :list

  validates :item, presence: true

  after_initialize :init

  def init
    self.checked ||= false
  end

end
