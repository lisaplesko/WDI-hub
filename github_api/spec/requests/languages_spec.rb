require 'rails_helper'

describe "Languages API" do
  it 'retrieves a students languages' do
    student = FactoryGirl.create(:student)
    student.repos << FactoryGirl.create(:repo)
    student.repos[0].languages << FactoryGirl.create(:language)
    get "/students/#{student.id}/total_language"

    expect(response).to be_success
    json = JSON.parse(response.body)

    expect(json.keys.first).to eq(student.repos[0].languages[0][:lang_name])
    expect(json.length).to eq(1)
  end
end
