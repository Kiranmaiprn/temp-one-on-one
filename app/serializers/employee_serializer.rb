class EmployeeSerializer < ActiveModel::Serializer
  attributes :name, :role, :id, :email, :created_at
  
end
