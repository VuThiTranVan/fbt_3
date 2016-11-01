require "rails_helper"

RSpec.describe "tours/show.html.erb", type: :view do
  let(:tour) {FactoryGirl.create(:tour)}

  it "should show tour" do
    assign :tour, tour
    render
    expect(rendered).to include(tour.name)
    expect(rendered).to include(tour.time)
    expect(rendered).to include(tour.transport)
    expect(rendered).to include(tour.place_departure)
    expect(rendered).to include(tour.time_start.to_s)
    expect(rendered).to include(tour.schedule)
    expect(rendered).to include(tour.price.to_i.to_s)
    expect(rendered).to include(tour.content)
  end
end
