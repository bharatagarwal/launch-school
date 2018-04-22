def foo(param = 'no')
  'yes'
end  

def bar(param = 'no')
  param == 'no' ? 'yes' : 'no'
end  

bar(foo)

# => 'no'

# foo becomes 'yes' in the absence of parameter
# bar('yes') i.e. else or ternary operator used. 