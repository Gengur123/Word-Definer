require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('new_word', :with => 'bob')
    click_on('Create')
    expect(page).to have_content('bob')
  end
end

describe('should deletes a word', {:type => :feature}) do
  it('deletes a word') do
    word = Word.new('kekw', nil)
    word.save()
    word2 = Word.new('wow', nil)
    word2.save()
    visit("/words/#{word.id}/edit")
    click_on('Delete Word!')
    expect(page).to have_no_content('kekw')
  end
end

describe('edits a word', {:type => :feature}) do
  it('edits a word') do
    word = Word.new('omegalul', nil)
    word.save()
    word2 = Word.new('spellify', nil)
    word2.save()
    visit("/words/#{word.id}/edit")
    fill_in('name', :with => "rngjesus")
    click_on('Change the Word')
    expect(page).to have_content('rngjesus')
    expect(page).to have_no_content('omegalul')
  end
end

describe('create an definition path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    word = Word.new('kekw', nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'to get kekw')
    click_on('Add Definition')
    expect(page).to have_content('to get kekw')
  end
end

describe('edit a definition', {:type => :feature}) do
  it('edits a definition') do
    word = Word.new('kekw', nil)
    word.save()
    definition = Definition.new('to get kekw', word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in('redefine', :with => 'to get kekw')
    click_on('Change Definition')
    expect(page).to have_content('to get kekw')
  end
end

describe('delete a definition', {:type => :feature}) do
  it('deletes a definition') do
    word = Word.new('kekw', nil)
    word.save()
    definition = Definition.new('to get kekw', word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    click_on('Delete Definition!')
    expect(page).to have_no_content('to get kekw')
  end
end