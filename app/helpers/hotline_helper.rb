module HotlineHelper
    def hotline_show
    @person = Person.find(params[:id])
    @hotlines = Hotline.where(person_id: @person.id)
  end
end
