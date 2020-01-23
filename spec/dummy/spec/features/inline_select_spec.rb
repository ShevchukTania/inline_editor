require 'rails_helper'

RSpec.describe 'InlineSelect', type: :controller do
  let!(:post) { FactoryBot.create(:post, about: 'first') }

  describe 'Inline Selector', type: :feature, js: true do
    it "updates post from inline select" do
      visit root_path
      within(:css, ".post-about") do
        find('div.clickable-item', text: post.about).click
        expect(page).to have_css('.form.active')
      end

      within(:css, ".form.active") do
        find(:select).find(:option, text: 'second').select_option
      end

      expect(page).to have_css('.clickable-item span', text: 'second')
      expect(post.reload.about).to eq('second')
    end
  end
end
