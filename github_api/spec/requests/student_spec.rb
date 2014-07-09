require 'rails_helper'

describe "Students API" do
  it 'retrieves a specific student' do
    student = FactoryGirl.create(:student)
    get "/students/#{student.id}"

    # test for the 200 status-code
    expect(response).to be_success
    json = JSON.parse(response.body)

    # check that the student attributes are the same.
    expect(json["firstname"]).to eq(student.firstname)
    expect(json["lastname"]).to eq(student.lastname)
    expect(json["username"]).to eq(student.username)

    # ensure that private attributes aren't serialized
    expect(json["private_attr"]).to eq(nil)
  end
end
