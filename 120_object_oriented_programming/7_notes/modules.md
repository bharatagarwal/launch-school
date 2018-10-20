The first use case we'll discuss is using modules for namespacing. In this context, namespacing means organizing similar classes under a module. In other words, we'll use modules to group related classes. Therein lies the first advantage of using modules for namespacing. It becomes easy for us to recognize related classes in our code. The second advantage is it reduces the likelihood of our classes colliding with other similarly named classes in our codebase. Here's how we do it:

The second use case for modules we'll look at is using modules as a container for methods, called module methods. This involves using modules to house other methods. This is very useful for methods that seem out of place within your code. Let's use our Mammal module to demonstrate:

```ruby
value = Mammal.some_out_of_place_method(4)
# We can also call such methods by doing:

value = Mammal::some_out_of_place_method(4)
# although the former is the preferred way.
```
