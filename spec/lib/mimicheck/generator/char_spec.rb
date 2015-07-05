describe MimiCheck::Generator::Char do
  subject(:generator) { described_class.new }

  let(:property) { -> (x) { chars.include?(x) } }
  let(:chars) { (0..127).map(&:chr) }

  let(:trials) { 2000 }
  let(:generators) { generator }

  it_behaves_like 'generator'

  it { check(property) }
end
