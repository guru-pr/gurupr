require 'rails_helper'

RSpec.describe MemberHelper, type: :helper do
  let(:member) { build(:user, name: 'User Name', nickname: 'nick_name') }

  describe '#image_tag_for' do
    it 'returns the content with link and target' do
      result = image_tag_for(member, github_link: true)

      expect(result).to match /target=\"_blank\"/
      expect(result).to match /https:\/\/github.com\/nick_name/
    end

    it 'returns the content without a target and anchor' do
      result = image_tag_for(member)

      expect(result).to_not match /target=\"_blank\"/
    end

    it 'returns a link with background-image and user name as content' do
      result = image_tag_for(member)

      expect(result).to match /background-image/
      expect(result).to match /title=\"User Name\"/
    end
  end
end
