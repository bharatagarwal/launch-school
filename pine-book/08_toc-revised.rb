content = 
[ 	'Table of Contents',
	['1', 'Getting Started', '1',],
	['2', 'Numbers', '9',],
	['3', 'Letters', '13']
]

width = 50

content.each do |line|
	unless line == content.first
	print ("Chapter #{line[0]}: #{line[1]}").ljust(width)
	puts ("page #{line[2]}")
	else
	puts line.center(width)
	end
end