
require 'spec_helper'

describe Post do

  it "title should be automatically titleized before save" do
    post = Post.new(title: "lowercase post", content: "A great story")
    post.save! #if this doesnt save, we'll immediately get the error by using !
    expect(post.title).to eq("Lowercase Post")
  end

  it "post should be unpublished by default" do
    post = Post.new
    expect(post.is_published).to eq false
  end

  it "slug should be automatically generated" do
    post = Post.new(title: "New post!", content: "A great story")
    expect(post.slug).to eq(nil)
    post.save
    expect(post.slug).to eq("new-post")
  end
end
