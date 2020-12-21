require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '名前・メールアドレス・パスワードが入力されている' do
        expect(user).to be_valid
      end
      it 'メールアドレスが半角文字だけで尚且つ@が挿入されている' do
        user.email = 'test@test.com'
        expect(user).to be_valid
      end
      it 'パスワードが8文字以上32文字以内で半角英数字が挿入されている' do
        user.password = '1234567a'
        user.password_confirmation = user.password
        expect(user).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it '名前が入力されていない' do
        user.name = nil
        user.valid?
        expect(user.errors.full_messages).to include "Name can't be blank"
      end
      it 'メールアドレスが入力されていない' do
        user.email = nil
        user.valid?
        expect(user.errors.full_messages).to include "Email can't be blank"
      end
      it 'メールアドレスに全角文字が挿入されている' do
        user.email = 'ｔｅｓｔ@test.com'
        user.valid?
        expect(user.errors.full_messages).to include "Email is invalid"
      end
      it 'パスワードが入力されていない' do
        user.password = nil
        user.valid?
        expect(user.errors.full_messages).to include "Password can't be blank"
      end
      it 'パスワードが7文字以下になっている' do
        user.password = '123456a'
        user.valid?
        expect(user.errors.full_messages).to include "Password is invalid"
      end
      it 'パスワードが33文字以上になっている' do
        user.password = '12345678901234567890123456789012a'
        user.valid?
        expect(user.errors.full_messages).to include "Password is invalid"
      end
      it 'パスワードに半角数字が挿入されていない' do
        user.password = '12345678'
        user.valid?
        expect(user.errors.full_messages).to include "Password is invalid"
      end
      it 'パスワードに半角英字が挿入されていない' do
        user.password = 'abcdefgh'
        user.valid?
        expect(user.errors.full_messages).to include "Password is invalid"
      end
      it '確認用パスワードが入力されていない' do
        user.password_confirmation = nil
        user.valid?
        expect(user.errors.full_messages).to include "Password confirmation can't be blank"
      end
      it '確認用パスワードとパスワードが一致しない' do
        user.password = 'a1234567'
        user.password_confirmation = 'b1234567'
        user.valid?
        expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
