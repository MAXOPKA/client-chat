class RoomsController < ApplicationController

  include RoomsHelper

  before_action :set_room, only: [:destroy, :update, :edit, :show]

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if Room.create
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show

  end

  def index
    @rooms = Room.all
  end

  def edit

  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :locked)
  end

end
