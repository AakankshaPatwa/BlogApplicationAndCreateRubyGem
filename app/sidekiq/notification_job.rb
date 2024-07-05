# class NotificationJob
#   include Sidekiq::Job

#   def perform(*args)
#     # Do something
#   end
# end


class NotificationJob
  include Sidekiq::Job
  sidekiq_options queue: 'mailers'

  def perform(post_id)
    post = Post.find(post_id)
    # Simulating sending an email
    puts "Sending notification for post: #{post.title}"
    # Here, you would normally use a mailer, like:
    # PostMailer.new_post_notification(post).deliver_now
  end
end
