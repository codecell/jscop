require_relative '../lib/jscop/spacing_checker'

RSpec.describe ClassName do
  let(:bad_spacing_1) { ' class Emaker {}' }
  let(:bad_spacing_2) { 'var  soil = 6' }
  let(:good_spacing) { 'class GoodName {}' }

  describe '#found_spaces method' do
    it('Should return TRUE if WRONG spacing is detected') do
      actual = SpacingChecker.found_spaces(bad_spacing_1)
      expect(actual).to eq(true)
    end

    it('Should return TRUE if WRONG spacing is detected') do
      actual = SpacingChecker.found_spaces(bad_spacing_2)
      expect(actual).to eq(true)
    end

    it('Should return FALSE if RIGHT spacing is detected') do
      actual = SpacingChecker.found_spaces(good_spacing)
      expect(actual).to eq(false)
    end
  end
end
