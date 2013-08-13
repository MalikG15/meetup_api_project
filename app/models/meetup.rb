class Meetup < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image, styles: { medium: "1000x1000>", thumb: "100x100>" }
  validates :title, presence: true, uniqueness: true
  # validates :content, presence: true
  acts_as_votable 

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end 

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end

  def like
    like_1 = [0]
     @like_1 = like_1
     @like_1.collect! {|x| x + 1}
    like_2 = @like_1[0]
    # @meetup = Meetup.find(params[:id])
    # # redirect_to @meetup_path, :notice => "You like this, #{like_2} person likes this"
  end
end
