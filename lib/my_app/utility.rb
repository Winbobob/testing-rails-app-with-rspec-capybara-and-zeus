module MyApp::Utility
  def self.random_string(_length)
    length = _length.to_i
    raise "Wrong argument 'length' given: #{_length.inspect}" if length < 0

    chars = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
    chars_length = chars.length
    length.times.map{ chars[rand(chars_length)] }.join
  end
end
