def log block_description, &block
  print "\t"*$nested
  puts 'Beginning "' + "#{block_description}"+ '"...'
  $nested +=1
  ret = block.call
  $nested-=1
  print "\t"*($nested)
  puts '..."' + "#{block_description}" + '" finished, returning: '+ ret.to_s
end

$nested = 0

log 'outer block' do
  log 'inner block' do
    log 'inner inner block' do
      5
    end
    'thai'
  end
  false
end