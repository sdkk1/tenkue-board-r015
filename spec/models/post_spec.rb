require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { build(:post, user_id: user.id) }

  describe '掲示板新規投稿' do
    context '新規投稿ができる場合' do
      it '投稿の内容が入力されている' do
        expect(post).to be_valid
      end
      it '内容が140文字以内で入力されている' do
        post.content = Faker::Lorem.characters(number: 140)
        expect(post).to be_valid
      end
    end
    context '新規投稿ができない場合' do
      it '投稿の内容が入力されていない' do
        post.content = nil
        post.valid?
        expect(post.errors.full_messages).to include "投稿内容を入力してください"
      end
      it '内容が141文字以上で入力されている' do
        post.content = Faker::Lorem.characters(number: 141)
        post.valid?
        expect(post.errors.full_messages).to include "投稿内容は140文字以内で入力してください"
      end
      it '投稿に紐づくユーザーがいない' do
        post.user_id = nil
        post.valid?
        expect(post.errors.full_messages).to include "ユーザーを入力してください"
      end
    end
  end
end
