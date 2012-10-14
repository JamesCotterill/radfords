require 'spec_helper'

describe PagesController do
  render_views

  before (:each) do
    @base_title = "Radfords of Somerford"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.body.should have_selector('title', content: 'Home')
    end

    it "should display the next event" do
      event1 = FactoryGirl.create( :event, name: "Melton Mowbray Farmers' Market",
                                takes_place_on: 1.week.ago,
                                location: "Cattle Market, Scarlford Road" )
      event2 = FactoryGirl.create( :event, name: "Huntingdon Farmer's Market",
                                takes_place_on: 1.week.from_now,
                                location: "Market Square" )
      event3 = FactoryGirl.create( :event, name: "Otley Farmer's Market",
                                takes_place_on: 1.day.from_now,
                                location: "Market Square")

      get :home

      response.body.should have_selector('span.title', content: event3.name)
    end
  end

  describe 'GET "outlets"' do
    before(:each) do
      Supplier.any_instance.stub :geocode
      @supplier = FactoryGirl.create(:supplier)
      second = FactoryGirl.create(:supplier, address: '75 Lairg Road, Newcastle upon Type NE1 0TF', name: 'Jasmine Haynes', telephone_number: '070 0060 9200', website: 'http://marketingtickets.com/')
      third = FactoryGirl.create(:supplier, address: '27 Vicar Lane, Saron SA44 8HH', name: 'Jamie Hunter', telephone_number: '079 8825 0308', website: 'http://aromatherapyjobs.com/')
      @suppliers = [@supplier, second, third]

      30.times do
        @suppliers << FactoryGirl.create(:supplier)
      end
    end

    it 'should be successful' do
      get :outlets
      response.should be_success
    end

    it "should have the right title" do
      get 'outlets'
      response.body.should have_selector('title', content: 'Outlets')
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.body.should have_selector('title', content: 'Contact')
    end
  end

end
