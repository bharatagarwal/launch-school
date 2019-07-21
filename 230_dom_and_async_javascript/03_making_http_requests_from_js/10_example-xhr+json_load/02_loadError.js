var request = new XMLHttpRequest();

request.open('GET', 'hts://api.github.com/repos/rails/rails');

request.responseType = 'json';

request.send();

request.addEventListener('load', function(event) {
  console.log(request.status);
  console.log(request.response.open_issues_count);
});

request.addEventListener('error', function(event) {
  console.log('The request could not be completed.')
})