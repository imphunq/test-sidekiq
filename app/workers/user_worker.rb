class UserWorker
  include Sidekiq::Worker

  def perform user_id, age
    user = User.find_by id: user_id
    return unless user

    user.increment! :age, age
    # destroy_jobs user_id, age
  end

  def destroy_jobs user_id, age
    jobs = Sidekiq::ScheduledSet.new select do |retri|
      retri.klass == self.class.name && retri.item["args"] == [user_id, age]
    end

    jobs.each(&:delete)
  end
end
