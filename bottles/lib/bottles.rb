class Bottles
	def verse(num)
    "#{bottle_or_bottles(num)} of beer on the wall, #{bottle_or_bottles(num)} of beer.\n".capitalize+"#{one_or_more(num)}".capitalize
  end

  def bottle_or_bottles(num)
    if num == 1
      "#{num} bottle"
    elsif num > 1
      "#{num} bottles"
    else
      "no more bottles"
    end
  end

  def one_or_it(num)
    if num > 1
      "one"
    else
      "it"
    end
  end

  def one_or_more(num)
    if num >= 1
      "Take #{one_or_it(num)} down and pass it around, #{bottle_or_bottles(num-1)} of beer on the wall.\n"
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n".capitalize
  end
    
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
