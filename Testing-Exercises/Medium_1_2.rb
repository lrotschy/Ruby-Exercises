# Medium_1_2.rb

class TextAnalyzer

  def process
    file = File.open('text.txt', 'r')
    yield(file.read)
    file.close
  end

end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "This text has #{text.split.length } words" }
analyzer.process { |text| puts "This text has #{text.split("\n\n").length } paragraphs" }
analyzer.process { |text| puts "This text has #{text.split("\n").length } words" }
analyzer.process { |text| puts "This text has #{text.chars.length } characters" }

class TextAnalyzer2
  def initialize(file_path)
    @file_text = File.read(file_path)
  end

  def process
    yield(@file_text)
  end
end

analyzer2 = TextAnalyzer2.new("text.txt")
analyzer2.process { |text| puts "This text has #{text.split.length } words" }

class TextAnalyzer3
  def process(file_path)
    text = File.read(file_path)
    yield(text)
  end
end

analyzer3 = TextAnalyzer3.new
analyzer3.process("text.txt") { |text| puts "This text has #{text.split.length } words" }

class TextAnalyzer4
  def process(file_path, &block)
    File.open(file_path, &block)
  end
end

analyzer4 = TextAnalyzer4.new
analyzer4.process("text.txt") { |file| puts "#{file.read.split.length}" }
