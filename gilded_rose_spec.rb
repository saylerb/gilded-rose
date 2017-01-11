require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality!
      expect(items[0].name).to eq "foo"
    end

    it "changes all the items" do
      items = [Item.new("foo", 0, 0),
               Item.new("foo", 10, 20)]

      GildedRose.new(items).update_quality!
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 0

      expect(items[1].sell_in).to eq 9
      expect(items[1].quality).to eq 19
    end

    it "increases the quality of brie" do
      items = [AgedBrie.new("Aged Brie", 10, 10),
               AgedBrie.new("Aged Brie", 10, 50)]

      GildedRose.new(items).update_quality!

      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 11

      expect(items[1].sell_in).to eq 9
      expect(items[1].quality).to eq 50
    end

    it "changes the quality of the backstage passes" do
      items = [BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 20, 10),
               BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 10, 10),
               BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 8, 10),
               BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 10),
               BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 3, 10),
               BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]

      GildedRose.new(items).update_quality!

      expect(items[0].quality).to eq 11
      expect(items[1].quality).to eq 12
      expect(items[2].quality).to eq 12
      expect(items[3].quality).to eq 13
      expect(items[4].quality).to eq 13
      expect(items[5].quality).to eq 0
    end
  end
end
