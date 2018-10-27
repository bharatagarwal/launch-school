def call_block
  yield
end

name = 'Bharat'

call_block { puts name }

name = 'Jeremy'