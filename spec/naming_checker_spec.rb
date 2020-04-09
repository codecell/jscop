require_relative '../lib/modules/naming_checker'

RSpec.describe NamingChecker do
  let(:bad_name) { 'var 8meka = 8' }
  let(:good_name) { 'var playMaker = 8' }

  describe '#bad_var_case method' do
    it('Should return TRUE if WRONG Variable is supplied') do
      actual = NamingChecker.bad_var_case(bad_name)
      expect(actual).to eq(true)
    end

    it('Should return FALSE if RIGHT Variable is supplied') do
      actual = NamingChecker.bad_var_case(good_name)
      expect(actual).to eq(false)
    end
  end
end
