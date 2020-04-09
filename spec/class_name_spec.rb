require_relative '../lib/modules/class_name'

RSpec.describe ClassName do
  let(:bad_class_1) { 'class Ema-ker {}' }
  let(:bad_class_2) { 'class ambadtoo {}' }
  let(:good_class) { 'class GoodName {}' }

  describe '#bad_class_name method' do
    it('Should return TRUE if WRONG Class name is supplied') do
      actual = ClassName.bad_class_name(bad_class_1)
      expect(actual).to eq(true)
    end

    it('Should return TRUE if WRONG Class name is supplied') do
      actual = ClassName.bad_class_name(bad_class_2)
      expect(actual).to eq(true)
    end

    it('Should return FALSE if RIGHT Class name is supplied') do
      actual = ClassName.bad_class_name(good_class)
      expect(actual).to eq(false)
    end
  end
end
