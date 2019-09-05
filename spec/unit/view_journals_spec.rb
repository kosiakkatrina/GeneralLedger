require 'view_journals'

describe ViewJournals do
  class Gateway
    def initialize(journals)
      @journals = journals
    end

    def all
      @journals
    end
  end

  it "can view no journals" do
    journals = ViewJournals.new(Gateway.new([]))
    expect(journals.execute({})).to eq(journals: [])
  end

  it "can view a single journal with no entries" do
    gateway = Gateway.new([Journal.new({date: '2019/09/05', comments: '', entries: []})])
    journals = ViewJournals.new(gateway)
    expect(journals.execute({})).to(
        eq(journals: [{date: '2019/09/05', comments: '', entries: []}])
    )
  end
end