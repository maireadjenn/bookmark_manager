feature 'checking the tags can be filtered' do

  scenario 'user only sees links with "bubbles" tag on that page' do
    visit ('/links/new')
    fill_in :new_link_title, with: 'Ellie Wem'
    fill_in :new_link_url, with: 'http://www.elliewem.co.uk'
    fill_in :new_link_tag, with: 'bubbles'
    click_button 'create link'
    click_button 'add link'
    fill_in :new_link_title, with: 'Google'
    fill_in :new_link_url, with: 'http://www.google.co.uk'
    fill_in :new_link_tag, with: 'search'
    click_button 'create link'
    click_button 'bubbles'
    expect(page).not_to have_link('Google')
    expect(page).to have_content('Ellie Wem')
  end
end

    # Link.create(url: 'http://www.elliewem.co.uk',
    #             title: 'Ellie Wem',
    #             tags: [Tag.first_or_create(tag: 'bubbles')])
    # Link.create(url: "http://www.google.com",
    #             title: "Google",
    #             tags: [Tag.first_or_create(tag: 'search')])
    # p @links09ds
    # p @links.tag
    # visit('/tags/bubbles')



#
# link = Link.new(url: 'http://www.elliewem.co.uk',
#             title: 'Ellie Wem',
#             tags: [Tag.first_or_create(tag: 'bubbles')])
# link = Link.new(url: "http://www.google.com",
#             title: "My bubbling bookmark",
#             tags: [Tag.first_or_create(name: 'search')])

# tag  = Tag.first_or_create(tag: 'bubbles')
# link.tags << tag
# link.save
#
# tags: [Tag.first_or_create(tag: 'bubbles')]


#
# Bookmark.create(url: "http://www.makersacademy.com", title: "My test bookmark", tags: [Tag.first_or_create(name: 'ruby')])
#
# Bookmark.create(url: "http://www.google.com", title: "My bubbling bookmark", tags: [Tag.first_or_create(name: 'bubbles')])
# visit ('/links/new')
# fill_in :new_link_title, with: 'Ellie Wem'
# fill_in :new_link_url, with: 'http://www.elliewem.co.uk'
# fill_in :new_link_tag, with: 'bubbles'
# click_button 'create link'
# click_button 'add link'
# fill_in :new_link_title, with: 'Google'
# fill_in :new_link_url, with: 'http://www.google.co.uk'
# fill_in :new_link_tag, with: 'search'
# click_button 'create link'
# click_button 'bubbles'
