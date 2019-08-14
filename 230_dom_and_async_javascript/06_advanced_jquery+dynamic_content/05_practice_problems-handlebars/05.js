// Create a posts array, adding the existing post to it. Add a second post with no tags property. Modify your template to check for the existence of tags, and if none exist, output a "Not tagged" message. Wrap the template in an each loop to output each post.


var posts = [{
              title: 'Lorem ipsum dolor sit amet',
              published: 'April 1, 2015',
              body: '<b>Sed ut perspiciatis</b> unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
              tags: ['blog', 'technical', 'speculative'],
            },
            {
            title: 'Acquire Maguire',
              published: 'August 2nd, 2019',
              body: '<b>Sed ut perspiciatis</b> unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',

            }];