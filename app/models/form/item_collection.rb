class Form::ItemCollection < Form::Base
    @@number = 1
    attr_accessor :items
  
    def initialize(attributes = {})
      super attributes
      self.items = @@number.times.map { Item.new() } unless self.items.present?
    end
    
    # 上でsuper attributesとしているので必要
    def items_attributes=(attributes)
      self.items = []
      attributes.each do |_, value|
        item = Item.new(value)
        item.image = item.imageSet(value[:image])
        self.items << item
      end
    end
  
    def save
      # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
      Item.transaction do
        self.items.map(&:save!)
      end
        return true
      rescue => e
        return false
    end
    def self.number
      return @@number
    end

    def self.addNum(num)
      number = num.to_i
      @@number = number + 1
    end

    def self.downNum
      @@number-=1
    end
  end