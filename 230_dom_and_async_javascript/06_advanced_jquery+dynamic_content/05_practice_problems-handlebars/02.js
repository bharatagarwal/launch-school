// Change your post object's body property to contain HTML elements as part of the string. Modify your Handlebars template to allow HTML to be output unescaped.

var post = {
  title: '<h1>Lorem ipsum dolor sit amet</h1>',
  published: 'April 1, 2015',
  body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'
};

<script>
    // document.addEventListener('DOMContentLoaded', function(e) {
      var post = {
        title: 'Lorem ipsum dolor sit amet',
        published: 'April 1, 2015',
        body: '<b>Sed ut perspiciatis</b> unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'
      };

      var templateNode = document.querySelector('#post');
      var textCreator = Handlebars.compile(templateNode.textContent);

      $(document.body).append(textCreator(post));
  // });
  </script>