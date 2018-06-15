# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :string           not null
#  band_id    :integer          not null
#  live?      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  validates :title, presence: true
  validates :year, presence: true
  validates :band, presence: true

  belongs_to :band

  has_many :tracks


end
