require "rails_helper"

RSpec.describe Tour, type: :model do
  let(:tour) do
    mock_model Tour,
      name: "tour",
      schedule: "Da Nang - Hoi An",
      place_departure: "Da Nang",
      time: "2 ngay 1 dem",
      people_number: "2",
      transport: "Xe may",
      price: 10,
      content: "This is a tour",
      time_start: "01-01-2016"
  end

  context "relationship" do
    context "test belong_to category tour" do
      it {is_expected.to belong_to :category_tour}
    end

    context "test have_many book tour" do
      it {is_expected.to have_many(:book_tours)}
    end

    context "test have_many rating" do
      it {is_expected.to have_many :ratings}
    end

    context "test have_many image tour" do
      it {is_expected.to have_many :images_tours}
    end
  end

  context "validates" do
    context "name" do
      context "valid when name not nil" do
        it {is_expected.to validate_presence_of(:name)}
      end

      context "not valid when name length more than 100 characters" do
        it {is_expected.to validate_length_of(:name).is_at_most 100}
      end
    end

    context "valid when schedule not nil" do
      it {is_expected.to validate_presence_of(:schedule)}
    end

    context "valid when place_departure not nil" do
      it {is_expected.to validate_presence_of(:place_departure)}
    end

    context "valid when time not nil" do
      it {is_expected.to validate_presence_of(:time)}
    end

    context "valid when people_number not nil" do
      it {is_expected.to validate_presence_of(:people_number)}
    end

    context "valid when transport not nil" do
      it {is_expected.to validate_presence_of(:transport)}
    end

    context "valid when price not nil" do
      it {is_expected.to validate_presence_of(:price)}
    end

    context "valid when content not nil" do
      it {is_expected.to validate_presence_of(:content)}
    end

    context "valid when time_start not nil" do
      it {is_expected.to validate_presence_of(:time_start)}
    end
  end

  context "scope create_at DESC" do
    it "scope order desc" do
      tour1 = mock_model Tour, created_at: DateTime.new(2016,03,01)
      tour2 = mock_model Tour, created_at: DateTime.new(2016,02,01)
      tour3 = mock_model Tour, created_at: DateTime.new(2016,01,01)
      expect_result = [tour1, tour2, tour3]
      Tour.stub(:recent).and_return expect_result
      expect(Tour.recent).to eq(expect_result)
    end
  end
end
