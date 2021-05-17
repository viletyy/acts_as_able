class Diss < ApplicationRecord

  belongs_to :dissable, :polymorphic => true
  belongs_to :disser,   :polymorphic => true

end
