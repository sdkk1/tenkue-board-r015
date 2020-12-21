require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '名前・メールアドレス・パスワードが入力されている' do
      end
      it 'メールアドレスが半角文字だけで尚且つ@が挿入されている' do
      end
      it 'パスワードが8文字以上32文字以内で半角英数字が挿入されている' do
      end
    end
    context '新規登録ができない場合' do
      it '名前が入力されていない' do
      end
      it 'メールアドレスが入力されていない' do
      end
      it 'メールアドレスに全角文字が挿入されている' do
      end
      it 'パスワードが入力されていない' do
      end
      it 'パスワードが7文字以下になっている' do
      end
      it 'パスワードが33文字以上になっている' do
      end
      it 'パスワードに半角数字が挿入されていない' do
      end
      it 'パスワードに半角英字が挿入されていない' do
      end
      it '確認用パスワードが入力されていない' do
      end
      it '確認用パスワードとパスワードが一致しない' do
      end
    end
  end
end
