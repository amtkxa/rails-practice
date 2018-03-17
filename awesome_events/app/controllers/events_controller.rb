class EventsController < ApplicationController
  before_action :authenticate

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = create_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      renser :new
    end
  end

  private

  def events_params
    params.require(:event).permit(
      :name, :place, :content, :start_time, :end_time
    )
  end
end
