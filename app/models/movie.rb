class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  searchkick
  has_attached_file :image, styles: { thumb: "100x100>", square: "300x300>", rectangle: "800*100>" }, default_url: "/images/:style/nophoto.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

  def self.search(search)
    search ? where("title LIKE ?", "%#{search[:title]}%") : all
  end
end
