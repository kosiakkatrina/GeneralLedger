class Journal
  attr_reader :date, :comments, :entries
  def initialize(hash)
    @date = hash[:date]
    @comments = hash[:comments]
    @entries = hash[:entries]
  end
end