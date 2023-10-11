class EmployeeSigninSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :name, :role
end
