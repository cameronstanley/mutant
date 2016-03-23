module ApplicationHelper

  def alert_container_class(flash_type)
    {
      success: "alert-success", 
      error: "alert-danger", 
      alert: "alert-warning", 
      notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def alert_icon_class(flash_type)
    {
      success: "glyphicon glyphicon-ok",
      error: "glyphicon glyphicon-remove",
      alert: "glyphicon glyphicon-warning-sign",
      notice: "glyphicon glyphicon-info-sign"
    }[flash_type.to_sym] || flash_type.to_s
  end

end
