require 'rails_helper'

RSpec.describe "Employees", type: :request do

  let! (:employee1) {create :employee, name: "dcsf", email: "dsbhj@jvs", password: 347814, role: "ur_hr"}

  describe "GET /employees/all_employees" do
    it "works! (now write some real specs)" do
      get "/employees/all_employees"
      expect(response).to have_http_status(200)
    end
  end
end
