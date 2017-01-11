class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality!
    @items.each(&:update_quality!)
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update_quality!
    @quality = @quality - 1 if @quality > 0
    @sell_in = @sell_in - 1
    @quality = @quality - 1 if @sell_in < 0 && @quality > 0
  end
end

class AgedBrie < Item
  def update_quality!
    @quality = @quality + 1 if @quality < 50
    @sell_in = @sell_in - 1
  end
end

class BackstagePass < Item
  def update_quality!
    if @sell_in > 10
      @quality = @quality + 1
    elsif @sell_in > 5
      @quality = @quality + 2
    elsif @sell_in > 0
      @quality = @quality + 3
    else
      @quality = 0
    end
    @sell_in -= 1
  end
end
