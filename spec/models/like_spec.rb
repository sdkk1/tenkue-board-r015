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
      end
      it '未ログインユーザーによるいいね登録' do
      end
      it '存在しない投稿に対してのいいね登録' do
      end
    end
  end
end
