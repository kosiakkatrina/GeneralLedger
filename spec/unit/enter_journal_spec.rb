require "enter_journal"

describe EnterJournal do

  class Spy
    def save(journal)
      @last_saved_journal = journal

    end
    def last_saved_journal
      @last_saved_journal
    end
  end

  it "can add a journal with no entries" do
    spy = Spy.new
    use_case = EnterJournal.new(spy)
    use_case.execute( {date: '2019/09/05', comments: '', entries: []})
    expect(spy.last_saved_journal).not_to eq(nil)
  end

  it "can add a journal with no entries" do
    spy = Spy.new
    use_case = EnterJournal.new(spy)
    use_case.execute( {date: '2019/09/05', comments: '', entries: []})
    expect(spy.last_saved_journal.date).to eq('2019/09/05')
    expect(spy.last_saved_journal.comments).to eq('')
    expect(spy.last_saved_journal.entries).to eq([])
  end
end