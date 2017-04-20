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

end
