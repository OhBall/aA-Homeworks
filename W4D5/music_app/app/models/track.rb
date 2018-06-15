# == Schema Information
#
# Table name: tracks
#
#  id       :integer          not null, primary key
#  title    :string
#  ord      :integer
#  bonus?   :boolean          default(FALSE)
#  lyrics   :string
#  album_id :integer
#

class Track < ApplicationRecord

  validates :title, presence: true
  validates :ord, presence: true
  validates :album, presence: true

  belongs_to :album

  has_one :artist,
    through: :album

end
