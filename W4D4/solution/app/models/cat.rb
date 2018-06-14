# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#

require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  # freeze ensures that constants are immutable
  CAT_COLORS = %w(black white orange brown).freeze

  # N.B. Remember, Rails 5 automatically validates the presence of
  # belongs_to associations, so we can leave the validation of owner out
  # here.
  validates :birth_date, :color, :name, :sex, :owner, presence: true
  validates :color, inclusion: CAT_COLORS, unless: -> { color.blank? }
  validates :sex, inclusion: %w(M F), if: -> { sex }
  validate :birth_date_in_the_past, if: -> { birth_date }

  has_many :rental_requests,
    class_name: :CatRentalRequest,
    dependent: :destroy

  belongs_to :owner,
    class_name: 'User',
    foreign_key: :user_id

  def age
    time_ago_in_words(birth_date)
  end

  private

  def birth_date_in_the_past
    if birth_date && birth_date > Time.now
      errors[:birth_date] << 'must be in the past'
    end
  end
end
