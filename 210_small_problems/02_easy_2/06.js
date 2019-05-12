// Madlibs is a simple game where you create a story template with "blanks" for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

// Create a simple madlib program that prompts for a noun, a verb, an adverb, and an adjective, and injects them into a story that you create.

// Enter a noun: dog
// Enter a verb: walk
// Enter an adjective: blue
// Enter an adverb: quickly

// // console output
// Do you walk your blue dog quickly? That's hilarious!

let noun = prompt('Enter a noun: ');
let verb = prompt('Enter a verb: ');
let adjective = prompt('Enter an adjective: ');
let adverb = prompt('Enter an adverb: ');
let reaction = ['hilarious', 'brilliant', 'just mad'];

let madlib = `Do you ${verb} your ${adjective} ${noun} ${adverb}? That's ${reaction[Math.floor(reaction.length * Math.random())]}!`