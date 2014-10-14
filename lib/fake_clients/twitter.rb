class TwitterClient
  def initialize(user)
    @user = user
  end

  def tweet(text)
    Rails.logger.info "Tweeting: #{text}"
  end
end
