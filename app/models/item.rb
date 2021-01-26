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

  #画像ファイル付きのupdate
  def includeImageUpdate(params)
    self.image = self.imageSet(params[:image])
    self.name = params[:name]
    self.category = params[:category]
    self.info = params[:info]
    self.save
  end

  
  

   #関連加工法名検索
   def processNames
     array = []
     processings.each do |process|
       array.push(process.name)
     end
     return array
   end

   #商品の名前配列化(店頭商品セレクトで使用)
   def self.itemNames
     array = []
     all.each do |item|
       array << item.name
     end
     return array
   end

   #商品の加工法をすべて文字列化(店頭商品で使用)
   def itemProcesses
    str = ''
    processings.all.each do |process|
      str += process.name + ','
    end
    return str
   end
   
  
end
