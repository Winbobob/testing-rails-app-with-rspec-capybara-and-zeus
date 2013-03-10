# encoding: utf-8

假如 /^一共有(\d+)篇已发布的文章和(\d+)篇未发布的文章$/ do |total_published, total_unpublished|
  @published_posts = FactoryGirl.create_list(:post, total_published.to_i, published: true)
  @unpublished_posts = FactoryGirl.create_list(:post, total_unpublished.to_i, published: false)
end

当 /^我访问首页$/ do
  visit root_path
end

那么 /^我应该看到(\d+)篇已发布的文章$/ do |total|
  @published_posts.each do |post|
    page.should have_content(post.title)
  end
end

那么 /^我应该看不到那篇未发布的文章$/ do
  @unpublished_posts.each do |post|
    page.should have_no_content(post.title)
  end
end
