class Bottles
	def verse(num)
    #"#{bottle_or_bottles(num)} of beer on the wall, #{bottle_or_bottles(num)} of beer.\n".capitalize+"#{one_or_more(num)}".capitalize
    "#{bottle_or_bottles(num)} on the wall, #{bottle_or_bottles(num)}.#{one_or_more(num)}".gsub(/^\W*./, &:upcase)
  end

  def bottle_or_bottles(num)
    if num == 1
      "#{num} bottle of beer"
    elsif num > 1
      "#{num} bottles of beer"
    else
      "no more bottles of beer"
    end
  end

  def one_or_it(num)
    num > 1 ? "one" : "it"
  end

  def one_or_more(num)
    num >= 1 ? "\nTake #{one_or_it(num)} down and pass it around, #{bottle_or_bottles(num-1)} on the wall.\n" : "\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verses(num, num2)
    result = ""
    num.downto(num2).each do |v|
      result += self.verse(v) + "\n"
    end
    result
  end

  def sing
    verses(99,0)
  end
end
