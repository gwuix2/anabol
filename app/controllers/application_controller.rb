class ApplicationController < ActionController::Base
  protect_from_forgery


  # Globalisan szukseges helperek
  def ido(ido)
    ido.year.to_s + "-" + ido.month.to_s + "-" +  ido.day.to_s
  end
end
