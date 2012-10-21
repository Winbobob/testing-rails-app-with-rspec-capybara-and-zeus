# encoding: utf-8

require 'spec_helper'

feature '查看文章列表和文章详情' do
  background do
    # 三个已发布的文章: Post 1, Post 2, Post 3
    @published_posts = FactoryGirl.create_list :post, 3, published: true
    # 两个未发布的文章: Post 4, Post 5
    @unpublished_posts = FactoryGirl.create_list :post, 2, published: false

    visit posts_path
  end

  scenario '可以看到已发布的文章及链接' do
    @published_posts.each do |post|
      page.should have_content(post.title)
    end
  end

  scenario '应该看不到未发布的文章' do
    @unpublished_posts.each do |post|
      page.should_not have_content(post.title)
    end
  end

  context '查看文章详情' do
    background do
      @post = @published_posts.first
      click_link @post.title
    end

    scenario '可以看到文章的标题和内容' do
      page.should have_content(@post.title)
      page.should have_content(@post.body)
    end

    scenario '可以通过 "返回" 链接回到文章列表' do
      click_link '返回'
      current_path.should == posts_path
    end
  end
end
