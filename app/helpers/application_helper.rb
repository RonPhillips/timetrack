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
  
end

