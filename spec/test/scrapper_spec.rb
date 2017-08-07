require 'spec_helper'

describe Test::Scrapper do
  it "list the properties" do
    scrapper = Test::Scrapper.new("Pyrmont, NSW 2009")
    expect(scrapper.fetch[0]).to eq("206/320 Harris Street, Pyrmont, NSW 2009, Vanessa Deguara")
  end
end
