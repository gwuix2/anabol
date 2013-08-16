# coding: UTF-8
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
      Size.where(:profile_id => @profile.id).order("mikor DESC").collect(&(attr)).compact.last
    else
      '--'
    end
  end


  def changed_by(attr)
    @ch_0 = last_valid(attr)
    @ch_1 = Size.where(:profile_id => @profile.id).order("mikor DESC").collect(&(attr)).compact.last(2) - [last_valid(attr)]
    if @ch_1
      @ch_last = @ch_0.to_i - @ch_1.first.to_i
      #classes = []
      #classes << "text-info" if @ch_last > 0
      #classes << "text-error" if @ch_last < 0
      content_tag :span, class: "muted", title: "változás az utolsó mérés óta" do
        if @ch_last == 0
        elsif @ch_last > 0
         "+" + @ch_last.to_s + "cm"
        else
          @ch_last.to_s + "cm"
        end
      end
    else
    end
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

  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
