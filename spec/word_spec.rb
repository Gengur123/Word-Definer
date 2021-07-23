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
    it('should compare 2 words and have them equal') do
      word1 = Word.new('swag', nil)
      word2 = Word.new('swag', nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('.find') do
    it('should go to the word id and return it') do
      word1 = Word.new('omegalul', nil)
      word1.save()
      word2 = Word.new('kekw', nil)
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#edit') do
    it('should edit the word') do
      word1 = Word.new('swag', nil)
      word1.save()
      word2 = Word.new('kekw', nil)
      word1.edit('kekw')
      word2.edit('swag')
      expect(word1.inputword).to(eq('kekw'))
      expect(word2.inputword).to(eq('swag'))
    end
  end

  describe('#delete') do
    it('should delete a word based on id') do
      word1 = Word.new('bubblefy', nil)
      word1.save()
      word2 = Word.new('uncyorn', nil)
      word2.save()
      word3 = Word.new('flutterby', nil)
      word3.save()
      word2.delete()
      expect(Word.all).to(eq([word1, word3]))
    end
  end

end