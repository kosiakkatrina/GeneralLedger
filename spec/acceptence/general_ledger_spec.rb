require 'view_journals'
require 'enter_journal'

describe "general ledger" do

  class DataGateway
    def initialize()
    @journals = []
    end

    def save(journal)
     @journals << journal
    end

    def all
    @journals
    end

  end

  it "can view empty ledger" do
    journals = ViewJournals.new(DataGateway.new)
    expect(journals.execute({})).to eq(journals: [])
  end

  it "can view a single journal with no entries" do
    gateway = DataGateway.new()
    EnterJournal.new(gateway).execute({date: '2019/09/05', comments: '', entries: []})
    journals = ViewJournals.new(gateway)
    expect(journals.execute({})).to(
        eq(journals: [{ date: '2019/09/05', comments: '', entries: [] }])
    )
  end




end