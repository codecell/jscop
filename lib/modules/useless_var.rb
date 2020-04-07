arr = [4, "(ada)", 1, 3, "const  emeka  = 9  ", "let  ada  = 9  ", " ada  = 6  "]
cout = 0

var_hash = {}

# /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ "let  emeka  = 9  "
arr_ins = []

while cout < arr.length
  arr.each { |el| 
    /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ el.to_s
    arr_ins << lhs if lhs
    cout += 1
  }
end

arr_ins.map {|el| var_hash[el] = var_hash[el] ? var_hash[el] += 1 : 1}

hash_arr = var_hash.to_a
hash_arr.each {|a| puts "Warning: unused var #{a[0]} detected" if a[1] == 1}

# case-- var defined in parents [\s]*[\(]{1}[\s]?[\w\W]+[\)]{1}[\W]*
pat2 = /[\s]*[\(]{1}[\s]?[\w\W]+[\)]{1}[\W]*/
dplace = []
arr.each {|el| dplace << el if pat2.match?(el.to_s)}
puts dplace

pos_keys = ['const', 'let', 'var', '(', ')', '{', '}']
filterd = []

dplace.collect {|el| 
  elem = el.split('')
  filterd << elem if pos_keys.include?(elem)
  #puts filterd
  puts elem[1]
}
#puts filterd.join
