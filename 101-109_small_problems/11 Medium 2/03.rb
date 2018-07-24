def letter_percentages(string)
  size = string.length

  details = {
    uppercase: 0,
    lowercase: 0,
    neither: 0
  }

  string.chars.each do |char|
    if char.match(/[A-Z]/)
      details[:uppercase] += 1
    elsif char.match(/[a-z]/)
      details[:lowercase] += 1
    else
      details[:neither] += 1
    end
  end

  details[:uppercase] = (details[:uppercase] * 100.0 / size).round(2)
  details[:lowercase] = (details[:lowercase] * 100.0 / size).round(2)
  details[:neither] = (details[:neither] * 100.0 / size).round(2)

  p details
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }