require 'net/http'
require 'uri'

filename_in = 'urls.txt'
filename_out = 'redirected_urls.txt'

if ARGV.length > 0
  filename_in = ARGV[0].chomp
  filename_out = ARGV[1].chomp
end

urls = []

File.open(filename_in, 'r') do |file_in|
  while line = file_in.gets
    urls << line
  end
end

File.open(filename_out, 'w') do |file_out|
  urls.each_with_index do |uri, index|
    begin
      url = URI.parse(uri)
      res = Net::HTTP.start(url.host, url.port) { |http| http.get(url.request_uri) }
    rescue => exception
      puts "Oh no, exception! (#{exception.class}: #{exception.message}) ;( Trying again..."
      retry
    else
      file_out.puts (index + 1).to_s.rjust(4) + " " + res['location'].to_s
      puts "#{index + 1} written. Writing next..."
    end
  end
end
