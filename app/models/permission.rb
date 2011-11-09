class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :permissions_apply, :polymorphic=>true
end
