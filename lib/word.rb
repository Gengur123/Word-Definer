class Word
  attr_accessor :inputword :id
  @@words = {}
  @@total_ids = 0

  def initiallize(inputword, id)
    @inputword = inputword
    @id = id || @@total_ids +=
  end

  def self.all()
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.inputword, self.id)
  end

  def self.clear
    @@words = {}
    @@total_ids = 0

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.find(id)
    @@words[id]
  end

  def update(inputword)
    @inputword =inputword
  end

  def delete
    @@words.delete(self.id)
  end
end