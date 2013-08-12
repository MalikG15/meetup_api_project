class MostpoptagsController < ApplicationController
  def index
    @meetups = Meetup.all.to_a
    @sorted_meetups = @meetups.sort_by{|meetup| meetup.tags.length}.reverse
  end
end
