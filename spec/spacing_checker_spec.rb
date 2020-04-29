require_relative '../lib/jscop/spacing_checker'

RSpec.describe ClassName do
  let(:bad_spacing_1) { 'class  Emaker {}' }
  let(:bad_spacing_2) { 'var  soil = 6' }
  let(:bad_spacing_3) { 'var soil  = 6' }
  let(:bad_spacing_4) { 'var soil =  6' }
  let(:bad_spacing_5) { ' var soil =  6' }
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

    it('Should return TRUE if WRONG spacing is detected before the = sign') do
      actual = SpacingChecker.found_spaces(bad_spacing_3)
      expect(actual).to eq(true)
    end

    it('Should return TRUE if WRONG spacing is detected after the = sign') do
      actual = SpacingChecker.found_spaces(bad_spacing_4)
      expect(actual).to eq(true)
    end

    it('Should return FALSE if RIGHT spacing is detected') do
      actual = SpacingChecker.found_spaces(good_spacing)
      expect(actual).to eq(false)
    end
  end

  describe '#line_beginining_spaces method' do
    it('Should return TRUE if WRONG spacing is detected At begining of Line') do
      actual = SpacingChecker.line_beginining_spaces(bad_spacing_5)
      expect(actual).to eq(true)
    end

    it('Should return FALSE if Right spacing is observed at begining of line') do
      actual = SpacingChecker.line_beginining_spaces(good_spacing)
      expect(actual).to eq(false)
    end
  end
end
