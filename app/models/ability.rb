class Ability
  include CanCan::Ability
    def initialize(user)
      user.permissions.each do |permission|
        can permission.action.to_sym, permission.permissions_apply_type.constantize do |permissions_apply |
        permissions_apply.nil? ||
        permission.permissions_apply_id.nil? ||
        permission.permissions_apply_id == permissions_apply.id
      end
    end
  end
end


