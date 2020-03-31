class HappyBirthdayJob < ApplicationJob
  queue_as :default

  def perform user_id, age
    # UserMailer.with(user: user).welcome_email.deliver_now
    user = User.find_by id: user_id
    return unless user

    user.increment! :age, age
  end
end
