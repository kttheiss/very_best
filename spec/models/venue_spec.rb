require 'rails_helper'

RSpec.describe Venue, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookmarks) }

    it { should have_many(:dishes_at_venues) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
