describe MimiCheck::Generator::SuchThat do
  subject(:generator) { described_class.new(inner_gen, pred) }

  let(:inner_gen) { -> { Random.rand(-10..11) } }
  let(:pred) { -> (x) { x >= 5 } }

  let(:trials) { 100 }

  describe 'generate' do
    subject(:generate) { generator.generate }

    it { is_expected.to be_nonzero }
    it { check(pred, generator) }
  end
end
