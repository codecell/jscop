require_relative '../lib/js_parser'

RSpec.describe JsParser do
  let(:js_file) { JsParser.new('./spec/asset.js') }

  describe 'def set_lines method' do
    it('Should Parse the JS file passed and set the Filename for each line') do
      actual = js_file.lines[0].filename
      expect(actual).to eq('./spec/asset.js')
    end

    it('Should Parse a JS file passed to it into Array of Lines') do
      actual = js_file.lines[0].content
      expect(actual).to eq('// **values here affect Rspec results**')
    end
  end
end
