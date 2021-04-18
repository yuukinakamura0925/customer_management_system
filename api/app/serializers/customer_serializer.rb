class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :sex, :memo
end