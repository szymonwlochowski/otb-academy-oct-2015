class Bottles
  def verse(num)
    bottle_number = BottleNumber.for(num)
    next_bottle = BottleNumber.for bottle_number.decrement
      "#{bottle_number.no_more.capitalize} #{bottle_number.bottles_or_bottle} on the wall, #{bottle_number.no_more} #{bottle_number.bottles_or_bottle}.\n#{bottle_number.action}, #{next_bottle.no_more} #{next_bottle.bottles_or_bottle} on the wall.\n"
  end

  def verses(num, num2)
    result = ""
    num.downto(num2).map { |v| result += verse(v) + "\n" }
    result
  end

  def sing
    verses(99,0)
  end

end

class BottleNumber
  def self.for(num)
    begin
      Object.const_get("BottleNumber#{num}").new(num)
    rescue NameError
      BottleNumber.new(num)
    end
  end

  def initialize(num=nil)
    @num = num
  end

  def action
    "Take #{it_or_one} down and pass it around"
  end

  def bottles_or_bottle
    "bottles of beer"
  end

  def it_or_one
    "one"
  end

  def decrement
    @num.pred
  end

  def no_more
    "#{@num}"
  end  
end

class BottleNumber0 < BottleNumber
  def action
    "Go to the store and buy some more" 
  end

  def no_more
    "no more"
  end

  def decrement
    return 99 
  end
end

class BottleNumber1 < BottleNumber
  def bottles_or_bottle
    "bottle of beer" 
  end

  def it_or_one
    "it"
  end
end

class BottleNumber6 < BottleNumber
  def bottles_or_bottle
    "pack of beer"
  end
end
