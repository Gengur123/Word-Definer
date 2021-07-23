require "rspec"
require "pry"
require "word"

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('#Word') do
    it('creates a new word and stores it') do
      word1 = Word.new('swag', nil)
      expect(word1.inputword).to(eq('swag'))
    end
  end

  describe('.all') do
    it('returns and empty array where inputed words would be stored') do
      expect(Word.all).to(eq([]))
    end
  end
  
  describe('#save') do
    it('stores a word object in a hash, mocking a database') do
      word1 = Word.new('swag', nil)
      word1.save()
      word2 = Word.new('bruh', nil)
      word2.save()
      word3 = Word.new('kekw', nil)
      word3.save()
      expect(Word.all).to(eq([word1, word2, word3]))
    end
  end

end