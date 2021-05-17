class View < ApplicationRecord

  belongs_to :viewable, :polymorphic => true
  belongs_to :viewer,   :polymorphic => true

end
