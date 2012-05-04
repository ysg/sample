module ApplicationHelper

  def link_to_add_fields(name, f, association, link=true)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id ) do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    if link
      link_to(name, "#", class: "add_#{association}", data: {id: id, fields: fields.gsub("\n", "")})
    else
      button_to(name, {}, { type: "button", class: "add_#{association}", data: {id: id, fields: fields.gsub("\n", "")}} )
    end
  end

end
