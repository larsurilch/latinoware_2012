module ViewsHelper
  def list_home
    vector = {'areas' => areas_path, 'places' => places_path, 'inspections' => inspections_path}
    content_tag :ul, "data-role" => "listview", "data-inset" => true, "data-theme" => "b" do
      vector.each {|key, value| concat(content_tag :li, (link_to t("list").capitalize + ' ' + t(key), value, "data-transition" => "slide" ))}
    end
  end
  
  def th_timestamp
    th = content_tag(:th, t("created").capitalize)
    th << content_tag(:th, t("updated").capitalize)
    th << ((content_tag :th) * 2).html_safe
  end

  def form_buttons url, model, f
    content_tag :p do
      (link_to t("cancel").capitalize, url, "data-role" => "button", "data-inline" => true, "data-transition" => "slide", "data-direction" => "reverse", "data-theme" => "c", "data-icon" => "back") + 
      (model.new_record? ? (f.submit t("save").capitalize, "data-inline" => true, "data-theme" => "b", "data-icon" => "check") : (f.submit t("update").capitalize, "data-inline" => true, "data-theme" => "b", "data-icon" => "check"))
    end
  end
  
  def td_timestamp model
    td = content_tag(:td, (l model.created_at), :class => "timestamp")
    td << content_tag(:td, (l model.updated_at), :class => "timestamp")
  end
  
  def actions model, path, flag
    actions = ''
    
    if flag
      actions << content_tag(:td, (link_to image_tag("ico_info_24.png", :alt => t("show").capitalize, :title => t("show").capitalize), model, "data-transition" => "slide"), :class => "actions")
    end
    
    actions << content_tag(:td, (link_to image_tag("ico_edit_24.png", :alt => t("edit").capitalize, :title => t("edit").capitalize), path, "data-transition" => "slide"), :class => "actions")
    actions << content_tag(:td, (link_to image_tag("ico_delete_24.png", :alt => t("delete").capitalize, :title => t("delete").capitalize), model, method: :delete, data: { confirm: t("confirm") }), :class => "actions")
    
    actions.html_safe
  end
end