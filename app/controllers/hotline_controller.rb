class HotlineController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @person = Person.first#find(params[:id])
    @hotlines = Hotline.where(person_id: @person.id)
  end
end
