class ExampleJob < ApplicationJob
  queue_as :default

  def perform name
    puts "hello #{name}"
  end
end
