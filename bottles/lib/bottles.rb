class Bottles
	def verse(num)
    
		if num >= 1
			"#{bottle_or_bottles(num)} of beer on the wall, #{bottle_or_bottles(num)} of beer.\nTake #{one_or_it(num)} down and pass it around, #{bottle_or_bottles(num-1)} of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
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
