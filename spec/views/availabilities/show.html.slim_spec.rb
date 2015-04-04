require 'rails_helper'

RSpec.describe "availabilities/show", type: :view do
  before(:each) do
    @availability = assign(:availability, Availability.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
