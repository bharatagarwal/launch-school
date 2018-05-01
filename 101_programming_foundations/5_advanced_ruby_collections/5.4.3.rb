[[1,2],[3,4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

Line | Action | Object | Side Effect | Return | Used?
1       map    nest arr  none          new arr   no
1-5    outer b | each sub-arr | none | new array | yes, for transformation
2       map     arr       none    new arr  | yes, return value of block
2-4    inner b | num | none | integer | yes, for transformation
3       num | num | none | integer | yes, block return value

