floated elements take as much space as their content,
almost inline behavior.

You can give a fixed width and height, no problem.
If you're floating left/right, you can set relative width,
because you're imposing something onto the width of the
containing element.

You can't set a relative height, because the siblings may have
different heights, and therefore you can't infer yourself
the height to be relative to.