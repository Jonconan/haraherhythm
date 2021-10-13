module ItemHelper
  def shop_format(price)
    "¥ #{price.to_s(:delimited, delimiter: ',')} -"
  end
end
