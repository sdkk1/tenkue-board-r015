require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) { build(:comment, user_id: user.id, post_id: post.id) }

  describe 'コメント新規投稿' do
    context '新規投稿ができる場合' do
      it 'コメントの内容が入力されている' do
        expect(comment).to be_valid
      end
      it 'コメント内容が140文字以内で入力されている' do
        comment.comment = Faker::Lorem.characters(number: 140)
        expect(comment).to be_valid
      end
    end
    context '新規投稿ができない場合' do
      it 'コメントの内容が入力されていない' do
        comment.comment = nil
        comment.valid?
        expect(comment.errors.full_messages).to include "コメント内容を入力してください"
      end
      it 'コメント内容が141文字以上で入力されている' do
        comment.comment = Faker::Lorem.characters(number: 141)
        comment.valid?
        expect(comment.errors.full_messages).to include "コメント内容は140文字以内で入力してください"
      end
      it 'コメントに紐づくユーザーがいない' do
        comment.user_id = nil
        comment.valid?
        expect(comment.errors.full_messages).to include "ユーザーを入力してください"
      end
      it 'コメントに紐づく投稿がいない' do
        comment.post_id = nil
        comment.valid?
        expect(comment.errors.full_messages).to include "投稿を入力してください"
      end
    end
  end
end
