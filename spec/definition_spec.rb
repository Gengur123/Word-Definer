require('rspec')
require('word')
require('definition')
require('pry')

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new('swag', nil)
    @word.save()
  end
  
  describe('.all') do
    it('should return a list of all definitions') do
      definition1 = Definition.new('this word means to be cool!', @word.id, nil)
      definition1.save()
      definition2 = Definition.new('this word means to be cool!', @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('#save') do
    it('should save definitions to each new word') do
      definition1 = Definition.new('this word means to be cool!', @word.id, nil)
      definition1.save()
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('.clear') do
    it('should remove all definitions and return an empty array') do
      definition1 = Definition.new('this word means to be cool!', @word.id, nil)
      definition1.save()
      definition2 = Definition.new('this word means to be cool!', @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('should find a definition by its id') do
      definition1 = Definition.new('this word means to be cool!', @word.id, nil)
      definition1.save()
      definition2 = Definition.new('this word means to be cool!', @word.id, nil)
      definition2.save()
      expect(Definition.find(definition2.id)).to(eq(definition2))
    end
  end

  describe('#edit') do
    it('should edit a definition by its id') do
      definition1 = Definition.new('this word means to be cool!', @word.id, nil)
      definition1.save()
      definition1.edit('this word means to be cool!', @word.id)
      expect(definition1.inputdef).to(eq('this word means to be cool!'))
    end
  end

  describe('#delete') do
    it('should delete a definition from all of existence') do
      definition1 = Definition.new('this word means to be cool!', @word.id, nil)
      definition1.save()
      definition2 = Definition.new('this word means to be bad', @word.id, nil)
      definition2.save()
      definition2.delete()
      expect(Definition.all).to(eq([definition1]))
    end
  end
end