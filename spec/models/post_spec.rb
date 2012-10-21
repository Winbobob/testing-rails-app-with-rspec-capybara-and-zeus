# encoding: utf-8

require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end

describe Post, '#publish_posts' do
  before do
    @posts = FactoryGirl.create_list :post, 10, published: false
  end

  context '全部发布' do
    before { Post.publish_posts(@posts) }
    it 'should work' do
      @posts.all?{ |post| post.published }.should be_true
      # 重新从数据库查询数据
      Post.all.all?{ |post| post.published }.should be_true
    end
  end

  context '部分发布' do
    before { Post.publish_posts(@posts.first(3)) }
    it 'should work' do
      @posts.first(3).all?{ |post| post.published }.should be_true
      Post.find(@posts.first(3).map(&:id)).all?{ |post| post.published }.should be_true

      @posts.last(7).all?{ |post| !post.published }.should be_true
      Post.find(@posts.last(7).map(&:id)).all?{ |post| !post.published }.should be_true
    end
  end
end
