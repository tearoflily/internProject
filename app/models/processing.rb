class Processing < ApplicationRecord
  belongs_to :item
  enum status:{
    sasimi:          0, #刺身
    kirimi:          1, #切り身
    nimono:          2, #煮物用
    sioyaki:         3, #塩焼き用
    flay:            4, #フライ、天ぷら用
  }
end
