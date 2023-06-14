class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :mobile,:address
end
