class ComplaintSerializer < ActiveModel::Serializer
  attributes :id,:user_id, :category_id, :description,:status,:reject_reason,:complaint_type
