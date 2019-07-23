$(#id).filter(selector) -> filter jquery collection

p ~ p

Next Siblings Selector ('prev ~ siblings')
All siblings that follow after `prev` element, have the same parent, and match the filtering `siblings` selector

Next Adjacent Selector ('prev + next')
Selects all next elements matching "next" that are immediately preceded by a sibling "prev".

c.find('ul + p') === $('#content ul + p');

jquery collection.show()
jquery collection.hide()


c.addClass
c.toggleClass