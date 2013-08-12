class MostpopularController < ApplicationController
  def index
    @meetups = Meetup.all.to_a
    @sorted_meetups = @meetups.sort_by{|meetup| meetup.comments.length}.reverse
  end
end

