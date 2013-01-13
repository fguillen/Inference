module ApplicationHelper
  def menu_class(actual_menu_name)
    menus = {
      :widgets => ["/", "/widgets.*"],
      :dashboards => ["/dashboards.*"],
    }

    menus.each do |menu_name, menu_paths|
      return "active" if actual_menu_name == menu_name && menu_paths.any? { |e| request.fullpath.gsub(/\?.*/, "") =~ /^#{e}$/ }
    end

    return "no-active"
  end
end
