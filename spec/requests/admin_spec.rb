require 'spec_helper'

describe 'Admin' do
  context "on admin homepage" do
    it "can see a list of recent posts" do 
      
      admin_auth("geek", "jock")
      Post.create(title: "test1", content: "test1")
      Post.create(title: "test2", content: "test2")
      Post.create(title: "test3", content: "test3")
      visit admin_posts_url
      page.should have_content "All posts:"
      page.should have_content "Test1"
      page.should have_content "Test3"
    end

    it "can edit a post by clicking the edit link next to a post" do
      admin_auth("geek", "jock")
      Post.create(title: "test1", content: "test1")
      visit admin_posts_url
      click_link "Edit"
      page.should have_content "Edit Test1"
    end

    it "can delete a post by clicking the delete link next to a post" do
      admin_auth("geek", "jock")
      Post.create(title: "test1", content: "test1")
      visit admin_posts_url
      puts page.body
      click_link "Delete"
      page.should_not have_content "Test1"
    end

    it "can create a new post and view it" do
       visit new_admin_post_url

       expect {
         fill_in 'post_title',   with: "Hello world!"
         fill_in 'post_content', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         page.check('post_is_published')
         click_button "Save"
       }.to change(Post, :count).by(1)

       page.should have_content "Published: true"
       page.should have_content "Post was successfully saved."
     end
  end

  context "editing post" do
    it "can mark an existing post as unpublished" do
         # page.check('post_is_published')
         # click_button "Save"
      # page.should have_content "Published: false"
    end
  end

  context "on post show page" do
    it "can visit a post show page by clicking the title"
    it "can see an edit link that takes you to the edit post path"
    it "can go to the admin homepage by clicking the Admin welcome page link"
  end
end
