class PostCreator < MethodStruct.new(:current_user, :post_params, :method_name => :create)

  def create
    @post = Post.new(post_params)

    if @post.save
      twitter = TwitterClient.new(current_user)
      twitter.tweet "Blogged: #{@post.title}"

      search = SearchClient.new
      search.index @post
    end

    @post
  end

end
