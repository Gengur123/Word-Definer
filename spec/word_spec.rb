require "rspec"
require "pry"
require "word"

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('#Word') do
    it('creates a new word object with an entered name and a unique id') do
      word1 = Word.new('bubblefy', nil)
      expect(word1.inputword).to(eq('bubblefy'))
    end
  end
end