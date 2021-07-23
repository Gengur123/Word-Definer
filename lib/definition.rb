class Definition
  attr_accessor :inputdef, :word_id, :id
  @@definitions = {}
  @@total_ids = 0

  def initialize(inputdef, word_id, id)
    @inputdef = inputdef
    @word_id = word_id
    @id = id || @@total_ids += 1
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.inputdef, self.word_id, self.id)
  end

  def self.clear
    @@definitions = {}
    @@total_ids = 0
  end

  def ==(definition_to_compare)
    (self.inputdef() == definition_to_compare.inputdef()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(inputdef)
    @inputdef = inputdef
  end

  def delete
    @@definitions.delete(self.id)
  end

  def edit(inputdef, word_id)
    self.inputdef = inputdef
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(self.inputdef, self.word_id, self.id)
  end

  def self.find_by_word(word_id)
    definitions_arr = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions_arr.push(definition)
      end
    end
    definitions_arr
  end
  
  def word
    Word.find(self.word_id)
  end
end
