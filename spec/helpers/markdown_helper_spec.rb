require 'rails_helper'

RSpec.describe MarkdownHelper, type: :helper do
  include MarkdownHelper
  it 'renders markdown' do
    expect(render_markdown('**bold**')).to eq "<p><strong>bold</strong></p>\n"
  end
end
