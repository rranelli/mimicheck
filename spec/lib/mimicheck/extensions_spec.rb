describe MimiCheck::Extensions do
  subject(:obj) { extended_class.new }

  let(:extended_class) { Class.new { include MimiCheck::Extensions } }

  describe '#method_missing' do
    subject { obj.send(method_name, 1, 2, 3) }
    let(:method_name) { 'CarouselGen' }

    it { expect(obj).to respond_to(method_name) }
    it { is_expected.to be_a(MimiCheck::Generator::Carousel) }

    context 'when extending in a module' do
      subject { extended_module.send(method_name, 1, 2, 3) }

      let(:extended_module) { Module.new { extend MimiCheck::Extensions } }

      it { is_expected.to be_a(MimiCheck::Generator::Carousel) }
      it { expect(extended_module).to respond_to(method_name) }
    end
  end
end
