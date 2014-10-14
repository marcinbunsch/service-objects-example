require "rails_helper"

describe PostCreator do

  let(:current_user) { double("User") }

  let(:title) { "My post" }
  let(:body) { "Read me" }
  let(:post_params) do
    {
      :title => title,
      :body => body
    }
  end
  let(:twitter) { double("TwitterClient") }
  let(:search) { double("SearchClient") }
  let(:last_post) { Post.last }

  subject do
    PostCreator.new(current_user, post_params)
  end

  before do
    allow(TwitterClient).to receive_messages(:new => twitter)
    allow(SearchClient).to receive_messages(:new => search)
    allow(twitter).to receive_messages(:tweet => nil)
    allow(search).to receive_messages(:index => nil)
  end

  describe "with valid params" do
    it "creates a new Post with appropriate attributes" do
      post = subject.create
      expect(post.persisted?).to be true
      expect(post.title).to eq(title)
      expect(post.body).to eq(body)
    end

    it "tweets the Post" do
      expect(twitter).to receive(:tweet).with("Blogged: #{title}")
      subject.create
    end

    it "indexes the Post" do
      expect(search).to receive(:index)
      subject.create
    end

  end

end

