In the solution for the <a href="https://launchschool.com/exercises/1937fc28">Testing Object Equality</a> exercise, I noticed the helper function has a variable declaration that doesn't make sense to me. I wanted to check with a TA before submitting feedback, because I

```javascript
function valuesMatch(a, b) {
  var aKeys = Object.getOwnPropertyNames(a).sort();

# highlight
  var key;
# endhighlight
  
  return aKeys.every(function(key) {
    return a[key] === b[key];
  });
}
```

Is there a need to declare the variable `key` on line 4? I was tempted to send feedback saying that there's a stray declaration inside the matchValues function, but want to double check with a TA before making that conclusion. 