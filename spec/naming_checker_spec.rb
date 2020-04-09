# require_relative '../lib/modules/naming_checker'
# require_relative '../lib/modules/check_js_files'
# require_relative '../lib/line'
# require_relative '../lib/js_parser'
# require_relative '../lib/error'
# require_relative '../lib/helpers/lint_ware'

# RSpec.describe NamingChecker do
#   let(:line) { Line.new(1, 'var emeka = 4', 'line.js') }
#   let(:file) { LintWare.start_all('/home/alfrednoble/Desktop/microverse/js-companion/test.js') }
#   let(:good_name) { 'var 8meka = 8' }

#   describe '#check_naming' do
#     it('Should return False if RIGHT class naming is respected') do
#       actual = NamingChecker.check_naming(:file)
#       expect(actual).to eq(true)
#     end
#   end
# end
