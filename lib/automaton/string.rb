class String
  
  def camelize
    lower_case_and_underscored_word = self
    first_letter_in_uppercase = true
    if first_letter_in_uppercase
      lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    else
      lower_case_and_underscored_word.first.downcase + lower_case_and_underscored_word.camelize[1..-1]
    end
  end
end