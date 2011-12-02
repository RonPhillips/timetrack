module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Timetracker").join(" - ") unless parts.empty?
      end
    end
  end
  
  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end
  
  def authorized?(permission, permissions_apply, &block)
    block.call if can?(permission.to_sym, permissions_apply) ||
    current_user.try(:admin?)
    nil
  end
  
  def fmt_ss_date(the_date=nil)
    the_date.nil? ? out='' : out=the_date.strftime('%Y-%m-%dT00:00:00.000')
    return out
  end

end

