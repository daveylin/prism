module HotlineHelper
  
  def hotline_show
    @person = Person.find(params[:id])
    @hotlines = Hotline.where(person_id: @person.id)
  end

  
  def edit_hotline
    respond_to do |format|
      format.html
      format.js
    end
  end
end
