require 'journal'

class EnterJournal
  def initialize(gateway)
    @gateway = gateway
  end

  def execute(hash)
    @gateway.save(Journal.new(hash))
  end
end
