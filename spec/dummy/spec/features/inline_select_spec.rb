require 'rails_helper'

RSpec.describe 'InlineSelect', type: :controller do
  let!(:post) { FactoryBot.create(:post, title: 'first title', about: 'Ecology') }

  describe 'Inline Selector', type: :feature, js: true do
    it "updates post title from inline select" do
      visit root_path
      within(:css, ".post-title") do
        find('div.clickable-item', text: post.title).click
        expect(page).to have_css('.form.active')
      end

      within(:css, ".form.active") do
        find(:select).find(:option, text: 'second title').select_option
      end

      expect(page).to have_css('.clickable-item', text: 'second title')
      expect(page).to have_css('.flash-container .success', text: 'Record was successfully updated')
      expect(post.reload.title).to eq('second title')
    end

    it "updates post about from inline grouped select" do
      visit root_path
      within(:css, ".post-about") do
        find('div.clickable-item .with-label span', text: 'Ecology').click
        expect(page).to have_css('.form.active')
      end

      within(:css, ".form.active") do
        find(:select).find(:option, text: 'News').select_option
      end

      expect(page).to have_css('.clickable-item .with-label span', text: 'News')
      expect(page).to have_css('.flash-container .success', text: 'Record was successfully updated')
      expect(post.reload.about).to eq('News')
    end
  end
end
