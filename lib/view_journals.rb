class ViewJournals

  def initialize(gateway)
    @gateway = gateway
  end

  def execute(hash)
  { journals: @gateway.all.map{|j| {date: j.date, comments: j.comments, entries: []}}}
  end
end