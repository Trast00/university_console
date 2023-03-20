def convert_data(data, type)
  data = data.to_i if data.match?(/\A\d+\z/)
  data = data.to_s if type == String
  data
end

def get_input(message, type, between_values = [])
  data = ''
  until data.is_a?(type) &&
        (type == String ? !data.empty? : true) &&
        (between_values.empty? || between_values.include?(data))
    print message
    data = gets.chomp
    data = convert_data(data, type)
  end
  data
end