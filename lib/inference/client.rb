class Inference::Client
  mattr_accessor :redis_host
  @@redis_host = "localhost"

  def self.insert(key, timestamp, value)
    puts "XXX: sending key: #{Time.now.to_i}"
    client.zadd(key, timestamp, { :timestamp => timestamp, :value => value }.to_json )
    puts "XXX: key sent: #{Time.now.to_i}"
  end

  def self.client
    @client ||= Redis.new(:host => redis_host)
  end
end

