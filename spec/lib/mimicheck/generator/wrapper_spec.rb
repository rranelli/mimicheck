describe MimiCheck::Generator::Wrapper do
  subject(:generator) { described_class.new(wrapped) }
  let(:wrapped) { -> () { :wrapme } }

  it_behaves_like 'generator'

  describe '#generate' do
    subject(:generate) { generator.generate }

    it { is_expected.to eq(:wrapme) }
    it do
      expect(wrapped).to receive(:call).exactly(:once)
      generate
    end

    context 'when wrapped element is not a callable' do
      let(:wrapped) { :yo }
      it { is_expected.to eq(:yo) }
    end
  end
end
