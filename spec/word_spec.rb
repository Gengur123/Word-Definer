require "rspec"
require "pry"
require "word"

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('#Word') do
    it('should create a new word and stores it') do
      word1 = Word.new('swag', nil)
      expect(word1.inputword).to(eq('swag'))
    end
  end

  describe('.all') do
    it('should return an empty array where inputed words would be stored') do
      expect(Word.all).to(eq([]))
    end
  end
  
  describe('#save') do
    it('should store the new words in a hash') do
      word1 = Word.new('swag', nil)
      word1.save()
      word2 = Word.new('bruh', nil)
      word2.save()
      word3 = Word.new('kekw', nil)
      word3.save()
      word4 = Word.new('omegalul', nil)
      word4.save()
      expect(Word.all).to(eq([word1, word2, word3, word4]))
    end
  end

  describe('#==') do
    it('') do
      word1 = Word.new('swag', nil)
      word2 = Word.new('swag', nil)
      expect(word1).to(eq(word2))
    end
  end

end