require 'zlib'
abort 'No input file specified' if ARGV.empty?

Zlib::GzipReader.open(ARGV.first) do |gz|
  File.open(File.basename(ARGV.first, '.fc'), 'w') do |out|
    last = ''
    until gz.eof
      counter = gz.getc.ord
      delta = gz.gets.strip
      last = last[0, counter] + delta
      out.puts last
    end
  end
end
