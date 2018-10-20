Ruby defines the attributes and behaviors of its objects in classes. 

You can think of classes as basic outlines of what an object should be made of and what it should be able to do. 

This entire workflow of creating a new object or instance from a class is called `instantiation`.

A module is a collection of behaviors that is useable in other classes via mixins. 

When defining a class, we typically focus on two things: states and behaviors. 

States track attributes for individual objects. Behaviors are what objects are capable of doing.

instance variables are scoped at the object (or instance) level, and are how objects keep track of their states.

Even though they're two different objects, both are still objects (or instances) of class GoodDog and contain identical behaviors.

Instance variables keep track of state, and instance methods expose behavior for objects. Let's take a closer look at how to define them in a class.

We refer to the initialize method as a constructor, because it gets triggered whenever we create a new object.

Every object's state is unique, and instance variables are how we keep track.

And now, we can expose information about the state of the object using instance methods.

Classes are blueprints for objects.