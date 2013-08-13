class RealmeetupsController < ApplicationController
  def index
   RMeetup::Client.api_key = "327d17387a4c7e45265d1265ea1f";
    @results = RMeetup::Client.fetch(:events, {:zip => "11207", :topic => "movies", :order => "time"})
    @event = {}

    @results[1].event.keys.each do |key|
      @event[key] = @results[5].event[key]
    end
   @show = @event["venue_name"]
    @address = @event["venue_address1"]
    @time = @event["time"]
    @last_updated = @event["updated"]
    @rsvpcount = @event["rsvpcount"]
    @photo = @event["group_photo_url"]
    @name = @event["name"]
    @meetup_link = @event["event_url"]
    @guest_limit = @event["guest_limit"]
    @group_name = @event["group_name"]
    @description = @event["description"]
    @payment_required = @event["payment_required"]
  end 
end
