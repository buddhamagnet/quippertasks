module TasksHelper
  def sortable(column, link_title = nil)
    order = column == sort_column && sort_order == "ASC" ? "DESC" : "ASC"
    link_to link_title || column.titleize, :sort => column, :order => order
  end
end
