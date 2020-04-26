# /([\(][\w\W]+[\)])/ =~ "function (ebuka, white, black) {}"
#=> #<MatchData "cat" 1:"a">
all_vars = ['white']
# puts /([\(][\w\W]+[\)])/.last_match(0)
# /c(.)t/ =~ 'cat'        #=> 0
# /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ "  x = y  "
# dread = ' x = []  '
# puts /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/.match?(dread)
vary = /^\W+[\/\/]/.match?('// https://www.') #scommentedjs line
# vary = Regexp.last_match
puts 'Vary comming in'
puts vary

vary = vary.to_s.split

filtered = vary.collect {|e| 
  /([\w\-]+)/ =~ e 
  wanted = Regexp.last_match
  all_vars << wanted.to_s
}
ref = [3, 4] + [1, 2]
# puts ref.to_s
# puts filtered.length
#puts vary.length
# filter Again
var_count = {}
counter = 0
all_vars.map { |e|
  var_count[e] = var_count[e] ? var_count[e] + 1 : 1
}
# puts var_count