require 'zlib'
abort 'No input file specified' if ARGV.empty?

def count_commons_initial_letters(last, current) 
  (0 .. [last.length, current.length].min).each do |i|
    return i if last[i] != current[i]
  end
end

def words(file)
  IO.foreach(file) do |line|
    yield line.strip
  end
end

Zlib::GzipWriter.open("#{ARGV.first}.fc") do |gz|
  last = ''
  words(ARGV.first) do |word|
    c = count_commons_initial_letters(last, word)
    gz.putc(c)
    gz.puts(word[c, word.length - c])
    
    last = word
  end
end
