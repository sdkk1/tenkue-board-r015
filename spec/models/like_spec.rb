require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:like) { build(:like, user_id: user.id, post_id: post.id) }

  describe '投稿いいね登録機能' do
    context 'いいね登録ができる' do
      it 'ログインユーザーによる投稿に対しての初めてのいいね登録' do
        expect(like).to be_valid
      end
    end
    context 'いいね登録ができない場合' do
      it '投稿に対しての2回目以上のいいね登録' do
        like.save
        another_like = build(:like, user_id: user.id, post_id: post.id)
        another_like.valid?
        expect(another_like.errors.full_messages).to include "ユーザーはすでに存在します"
      end
      it '未ログインユーザーによるいいね登録' do
        like.user_id = nil
        like.valid?
        expect(like.errors.full_messages).to include "ユーザーを入力してください"
      end
      it '存在しない投稿に対してのいいね登録' do
        like.post_id = nil
        like.valid?
        expect(like.errors.full_messages).to include "投稿を入力してください"
      end
    end
  end
end
