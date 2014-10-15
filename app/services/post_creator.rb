class PostCreator < MethodStruct.new(:current_user, :post_params, :method_name => :create)

  def create
    post = Post.new(post_params)

    if post.save
      publish_to_twitter(post)
      index_post(post)
    end

    post
  end

  private

  def publish_to_twitter(post)
    twitter = TwitterClient.new(current_user)
    twitter.tweet "Blogged: #{post.title}"
  end

  def index_post(post)
    search = SearchClient.new
    search.index post
  end

end
