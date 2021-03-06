require('rspec')
require('./lib/coin_combinations')

describe('CoinCombinations#is_valid?') do
  let(:combination) { CoinCombinations.new }

  it("returns falsey if a negative number is input") do
    expect(combination.is_valid?("-1")).to be_falsey
  end
  it("returns truthy if a positive whole number is input") do
    expect(combination.is_valid?("1")).to be_truthy
  end
  it("returns truthy if a any number of zeros are input") do
    expect(combination.is_valid?("000000")).to be_truthy
  end
  it("returns falsey if a float number is input") do
    expect(combination.is_valid?("100.00")).to be_falsey
  end
  it("returns truthy if a bigger number is input") do
    expect(combination.is_valid?("99")).to be_truthy
  end
  it("returns falsey if a word string is input") do
    expect(combination.is_valid?("word")).to be_falsey
  end
  it("returns falsey if an empty string is input") do
    expect(combination.is_valid?("")).to be_falsey
  end
  it("returns falsey if a string with only whitespace is input") do
    expect(combination.is_valid?(" ")).to be_falsey
  end
end

describe('CoinCombinations#get_coins') do
  let(:combination) { CoinCombinations.new }

  it ("returns 0 is the input is 0") do
    expect(combination.get_coins("0")).to(eq("no coins!"))
  end
  it ("returns invalid input if the input is -1") do
    expect(combination.get_coins("-1")).to(eq("invalid input"))
  end
  it ("returns '1 penny' if the input is 1") do
    expect(combination.get_coins("1")).to(eq("1 penny"))
  end
end

describe('CoinCombinations#calculate_coins') do
  let(:combination) { CoinCombinations.new }

  it ("returns penny if the input is 1") do
    expect(combination.calculate_coins("1")).to(eq("1 penny"))
  end
  it ("returns singular names of 1 quarter and 1 nickel for input of 30") do
    expect(combination.calculate_coins("30")).to(eq("1 quarter, 1 nickel"))
  end
  it ("returns singular names of 1 nickel and 1 penny for input of 6") do
    expect(combination.calculate_coins("6")).to(eq("1 nickel, 1 penny"))
  end
  it ("returns 1 quarter 1 nickel") do
    expect(combination.calculate_coins("30")).to(eq("1 quarter, 1 nickel"))
  end
  it ("returns 3 quarters, 2 dimes, 4 pennies for 99") do
    expect(combination.calculate_coins("99")).to(eq("3 quarters, 2 dimes, 4 pennies"))
  end
end

describe('CoinCombinations#coin_plural') do
  let(:combination) { CoinCombinations.new }

  it ("returns 3 nickles if the input is 3, 'nickle'") do
    expect(combination.coin_plural(3, "nickle")).to(eq("3 nickles"))
  end
  it ("returns 1 quarter if the input is '1, quarter'") do
    expect(combination.coin_plural(1, "quarter")).to(eq("1 quarter"))
  end
  it ("returns 5 dimes if the input is '5, dime'") do
    expect(combination.coin_plural(5, "dime")).to(eq("5 dimes"))
  end
  it ("returns 4 pennies if the input is '4, penny'") do
    expect(combination.coin_plural(4, "penny")).to(eq("4 pennies"))
  end
end

describe('CoinCombinations#user_change') do
  let(:combination) { CoinCombinations.new }

  it ("returns '3 cents' from user input of 3") do
    expect(combination.user_change("3")).to(eq("3 cents"))
  end
  it ("returns '99 cents' from user input of 99") do
    expect(combination.user_change("99")).to(eq("99 cents"))
  end
  it ("returns '1 dollar 23 cents' from user input of 123") do
    expect(combination.user_change("123")).to(eq("1 dollar 23 cents"))
  end
  it ("returns '2 dollars 23 cents' from user input of 223") do
    expect(combination.user_change("223")).to(eq("2 dollars 23 cents"))
  end
  it ("returns '5 dollars 1 cent' from user input of 501") do
    expect(combination.user_change("501")).to(eq("5 dollars 1 cent"))
  end
  it ("returns '10 dollars' from user input of 501") do
    expect(combination.user_change("1000")).to(eq("10 dollars"))
  end
  it ("returns '1 dollar 1 cent' from user input of 501") do
    expect(combination.user_change("101")).to(eq("1 dollar 1 cent"))
  end
  it ("returns '1 dollar' from user input of 100") do
    expect(combination.user_change("100")).to(eq("1 dollar"))
  end
  it ("returns '1,100 dollars' from user input of 110000") do
    expect(combination.user_change("110000")).to(eq("1,100 dollars"))
  end
end
