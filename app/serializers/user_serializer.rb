class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :email, :password_digest
end
