module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end
  
  def action?(*action)
    action.include?(params[:action])
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge( sort: column, direction: direction, page: nil ), { class: css_class }
  end
end
