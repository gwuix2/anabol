module ApplicationHelper
	def bootstrap_class_for flash_type
      case flash_type
        when :success
          "alert-success"
        when :error
          "alert-error"
        when :alert
          "alert-block"
        when :notice
          "alert-info"
        else
          flash_type.to_s
      end
    end

  def last_valid(attr)
    if Size.where(:profile_id => @profile.id).collect(&(attr)).compact.last
      Size.where(:profile_id => @profile.id).order("mikor ASC").collect(&(attr)).compact.last
    else
      '--'
    end
  end


  def changed_by(attr)
    @lv_0 = last_valid(attr)
    @lv_1 = Size.where(:profile_id => @profile.id).order("mikor ASC").collect(&(attr)).compact.last(2) - [last_valid(attr)]
    @lv_last = @lv_0.to_i - @lv_1.first.to_i
    @lv_last
  end

  def kg(value)
    value.to_i.to_s + "kg" if value
  end

  def cm(value)
    value.to_i.to_s + "cm" if value
  end

  def pc(value)
    value.to_i.to_s + "%" if value
  end

  def own_profile?(profile)
    # ez is szoba johet: unless current_page?(edit_profile_path(current_user.profile))
    if current_user
      if profile.user_id == current_user.id
        true
      end
    end
  end

  def ido(ido)
    ido.year.to_s + "-" + ido.month.to_s + "-" +  ido.day.to_s
  end


end
