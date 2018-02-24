# variable scope changes for situations where there's a method being invoked.
# it won't change with a do..end for a for loop. But it does change when you
# invoke times, which is a method after all.

# types of variables:
# constants, global variables, class variables, instance variables, local variables.

MY_CONSTANT = 'I am available throughout your app.'

$var = 'I am also available throughout your app.'



@@instances = 0 # class variable: available to class and instance. not critical for each instance to have a unique value for this. must be initiatilized outside of method definitions, inside class scope.

@var = 'I am available throughout the current instance of this class.'

var = 'I must be passed around to cross scope boundaries.'
