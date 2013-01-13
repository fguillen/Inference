module Inference::RedisWrapper
  mattr_accessor :redis_host
  @@redis_host = "localhost"

  def self.del(key)
    client.del key
  end

  def self.keys
    client.keys "*"
  end

  def self.get(key, date_ini, date_end)
    elements = client.zrangebyscore key, date_ini.to_i, date_end.to_i
    elements = elements.map { |e| JSON.parse(e) }
  end

  def self.client
    @client ||= Redis.new(:host => redis_host)
  end
end