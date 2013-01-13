class Inference::Client
  mattr_accessor :redis_host
  @@redis_host = "localhost"

  def self.insert(key, time, value)
    time_string = time.strftime("%F %R:%S")
    puts "XXX: sending key.key: #{key}"
    puts "XXX: sending key.time_string: #{time_string}"
    puts "XXX: sending key.value: #{value}"
    client.zadd(key, time.to_i, { :time => time_string, :value => value }.to_json )
    puts "XXX: key sent"
  end

  def self.client
    @client ||= Redis.new(:host => redis_host)
  end
end

