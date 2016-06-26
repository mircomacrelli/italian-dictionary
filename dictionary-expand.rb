require 'zlib'
abort 'No input file specified' if ARGV.empty?

File.open(File.basename(ARGV.first, '.fc'), 'w') do |out|
  Zlib::GzipReader.open(ARGV.first) do |gz|
    last = ''
    until gz.eof
      counter = gz.getc.ord
      delta = gz.gets.strip
      last = last[0, counter] + delta
      out.puts last
    end
  end
end
