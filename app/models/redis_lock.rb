class RedisLock
  def self.acquire(lock_name, expiration_in_seconds)
    Sidekiq.redis {|client| client.set(lock_name, "locked", ex: expiration_in_seconds, nx: true)}
  end
end