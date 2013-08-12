class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
    RMeetup::Client.api_key = "327d17387a4c7e45265d1265ea1f"
    @results = RMeetup::Client.fetch(:events, {:zip => "11207", :topic => "moms", :order => "time"})
    @event = {}

    @results[1].event.keys.each do |key|
      @event[key] = @results[3].event[key]
    end
      throw @event
    @show = @event["description", "venue_city"]
   end

  def new
    @meetup = Meetup.new
  end

  def show
    @meetup = Meetup.find(params[:id])
    @comment = Comment.new
    @tag = Tag.new
    @comment.meetup_id = @meetup.id
  end

  def edit
    @meetup = Meetup.find(params[:id])
  end

  def update
    @meetup= Meetup.find(params[:id])
    @meetup.update(meetup_params)

     flash.notice = " The Meetup Idea '#{@meetup.title}' was updated!"
    redirect_to meetup_path(@meetup)
  end

  def destroy
     @meetup = Meetup.find(params[:id])
        @meetup.destroy
        flash.notice = "Meetup '#{@meetup.title}' Destroyed!"
        redirect_to meetups_path
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.save
    redirect_to meetup_path(@meetup)
  end

  def meetup_params
    params.require(:meetup).permit(:title, :body, :tag_list, :image)
  end


end
