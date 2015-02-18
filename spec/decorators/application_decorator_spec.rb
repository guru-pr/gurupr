require 'rails_helper'

RSpec.describe ApplicationDecorator, type: :decorator do
  subject { described_class.new Object.new }

  context '#renderer' do
    it { expect(subject.renderer).to be_an_instance_of(Redcarpet::Markdown) }
  end

  context '#render_markdown' do
    context 'with empty value to render' do
      before { expect(subject.renderer).not_to receive(:render) }
      it { expect(subject.render_markdown(nil)).to be_nil }
      it { expect(subject.render_markdown('')).to  be_nil }
    end

    context 'with value to render' do
      before(:each) { expect(subject.renderer).to receive(:render).once.with('markdown').and_return('html') }
      it { expect(subject.render_markdown('markdown')).to eq('html') }
      it { expect(subject.render_markdown('markdown').html_safe?).to be(true) }
    end
  end

end
