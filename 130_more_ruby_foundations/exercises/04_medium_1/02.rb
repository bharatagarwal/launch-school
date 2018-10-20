# Fill out the rest of the Ruby code below so that print output like that shown in "Sample Output." You should read the text from a simple text file that you provide. (We also supply some example text below, but try the program with your text as well.)

# Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the #process method or part of the blocks. You need no other additions or changes.

# The text you use does not have to produce the same numbers as the sample output but should have the indicated format.

class TextAnalyzer
  def process
    file = File.open '02_text.txt', 'r'
    yield(file.read)
    file.close
    end
  end
end

def paragraph_count text
  text.split("\n\n").count
end

def line_count text
  text.split("\n").count
end

def word_count text
  text.split(' ').count
end

analyzer = TextAnalyzer.new
analyzer.process
analyzer.process { |text| puts "#{paragraph_count text} paragraphs" }
analyzer.process { |text| puts "#{line_count text} lines" }
analyzer.process { |text| puts "#{word_count text} words"}