# Fixnum method from http://johnallen.us/?p=380

class Fixnum
  def commas
    self.to_s =~ /([^\.]*)(\..*)?/
    int, dec = $1.reverse, $2 ? $2 : ""
    while int.gsub!(/(,|\.|^)(\d{3})(\d)/, '\1\2,\3')
    end
    int.reverse + dec
  end
end



class CoinCombinations

  COINS = {
    "quarter" => 25,
    "dime" => 10,
    "nickel" => 5,
    "penny" => 1,
  }

  def is_valid?(user_input)
    user_input.match(/\A[0-9]+\z/)
  end

  def print_to_screen(user_input)
    unless is_valid?(user_input)
      "invalid input"
    else
      "From the #{user_change(user_input)} you input, your change would be: #{calculate_coins(user_input)}"
    end
  end

  def get_coins(user_input)
    unless is_valid?(user_input)
      "invalid input"
    else
      calculate_coins(user_input)
    end
  end

  def coin_plural(number_of_coins, coin)
    if number_of_coins == 1
      "#{number_of_coins} #{coin}"
    elsif coin == "penny"
      "#{number_of_coins} pennies"
    else
      coin_name = coin + "s"
      "#{number_of_coins} #{coin_name}"
    end
  end

  def calculate_coins(change)
    change = change.to_i

    if change == 0
      return "no coins!"
    end

    output = []

    COINS.each_pair do |coin, value|
      number_of_coins = 0
      until value > change
        number_of_coins += 1
        change -= value
      end
      unless number_of_coins == 0
        output.push(coin_plural(number_of_coins, coin))
      end
    end

    output.join(", ")
  end

  def user_change(user_input)
    change = user_input.slice(-2,2).to_i
    dollars = 0

    if user_input.to_i > 99
      dollars += (user_input.to_i - change) / 100
    end

    if user_input.to_i < 99
      change = user_input.to_i
    end


    user_input_to_words = String.new

    if dollars > 0
      user_input_to_words.concat("#{dollars.commas} #{dollars_pluralize(dollars)} ")
    end
    if change > 0
      user_input_to_words.concat("#{change} #{cents_pluralize(change)}")
    end

    user_input_to_words.rstrip

  end

  def cents_pluralize(num)
    if num > 1
      "cents"
    elsif num == 1
      "cent"
    end
  end

  def dollars_pluralize(num)
    if num > 1
      "dollars"
    elsif num == 1
      "dollar"
    end
  end

end
