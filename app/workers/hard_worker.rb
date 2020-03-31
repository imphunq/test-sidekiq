class HardWorker
  include Sidekiq::Worker

  def perform name, count
    puts "test perform sidekiq phu"
  end
end
