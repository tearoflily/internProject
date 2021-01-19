class Item < ApplicationRecord

  has_many :processings, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: {maximum: 10}
  scope  :descendingOrder,-> { order(id: :DESC)}
 
  enum status:{
    blue:            0, #青魚
    white:           1, #白身魚
    bigger:          2, #大型魚
    shellfish:       3, #貝類
    octopassquid:    4, #たこ、いか
    seaweeds:        5, #海藻
    others:          6, #その他
  }

  #画像の設定
  def imageSet(param)
    if param
      image = param.read
    end
  end

   #関連加工法名検索
   def processNames
     array = []
     processings.each do |process|
       array.push(process.name)
     end
     return array
   end
  
end
