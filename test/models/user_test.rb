require 'test_helper'

class UserTest < ActiveSupport::TestCase
  RSpec.describe User, type: :model do
    describe 'ユーザー新規登録' do
      it 'nicknameが空では登録できない' do
        user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
