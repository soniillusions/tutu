module ApplicationHelper
  def show_time_for_station?
    controller_name == 'routes' && action_name == 'show'
  end
end
