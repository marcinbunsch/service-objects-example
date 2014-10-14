class SearchClient

  def index(post)
    Rails.logger.info "Indexing: #{post.title}"
  end

end

