describe MimiCheck::Generator::Bool do
  subject(:generator) { described_class.new }

  let(:trials) { 1000 }

  it_behaves_like 'generator'

  describe '#generate' do
    subject(:generate) { -> (*) { generator.generate } }

    it 'is uniformly distributed' do
      gens = (1..500)
        .map(&generate)
        .group_by { |x| x }
        .map { |k, v| [k, v.size.to_f] }.to_h

      diff = gens[true] / (gens[false] + gens[true])

      expect(diff).to be_within(0.1).of(0.5)
    end

    describe 'result' do
      let(:generators) { [generator] }
      let(:property) { -> (x) { x == true || x == false } }

      it { check(property, *generators) }
    end
  end
end
