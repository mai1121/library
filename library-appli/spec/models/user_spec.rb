require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include "can't be blank"
    end

    it "is valid with a nickname, email, password" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include "has already been taken"
    end

    it "is invalid with a nickname that has more than 25 characters" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include "is too long (maximum is 25 characters)"
    end

    it "is valid with a nickname that has less than 24 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end
  end
end
