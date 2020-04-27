require_relative '../lib/classes/js_parser'
require_relative '../lib/classes/line.rb'

RSpec.describe JsParser do
  let(:js_file) { JsParser.new('./spec/asset.js') }
  let(:number) { js_file.lines[1].number }
  let(:content) { js_file.lines[1].content }
  let(:filename) { js_file.lines[1].filename }
  let(:define_line) { Line.new(number, content, filename) }

  describe 'def set_lines method' do
    it('Should set line number by Adding 1 to the index of the JSParser Array elements(lines)') do
      actual = define_line.number
      expect(actual).to eq(2)
    end

    it('Should set line contents by Adding contents at corresponding JsParser index + 1 content') do
      actual = define_line.content
      expect(actual).to eq(content)
    end

    it('Should set line source by Adding originating Filename corresponding to JsParser index + 1 name') do
      actual = define_line.filename
      expect(actual).to eq(filename)
    end
  end
end
