describe MimiCheck::Generator::Byte do
  let(:generator) { described_class.new }

  let(:property) { -> (x) { x.between?(0, 255) } }

  let(:trials) { 2000 }
  let(:generators) { [generator] }

  it_behaves_like 'generator'

  it { check(property) }
end
