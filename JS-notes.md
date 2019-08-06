# [nealalan.github.io](https://nealalan.github.io)/[js-notes](https://nealalan.github.io/js-notes) 
See also: [https://github.com/nealalan/code-exercises](https://github.com/nealalan/code-exercises)
## REFERENCE
- VALUES - [http://eloquentjavascript.net/01_values.html](http://eloquentjavascript.net/01_values.html)
- PROGRAM STRUCTURE - [http://eloquentjavascript.net/02_program_structure.html](http://eloquentjavascript.net/02_program_structure.html)
- FUNCTIONS - [http://eloquentjavascript.net/03_functions.html](http://eloquentjavascript.net/03_functions.html)
- DATA STRUCTURES - [http://eloquentjavascript.net/04_data.html](http://eloquentjavascript.net/04_data.html)
- HIGHER ORDER FUNCTIONS - [http://eloquentjavascript.net/05_higher_order.html](http://eloquentjavascript.net/05_higher_order.html)
- OBJECTS - [http://eloquentjavascript.net/06_object.html](http://eloquentjavascript.net/06_object.html)
- ROBOT - [http://eloquentjavascript.net/07_robot.html](http://eloquentjavascript.net/07_robot.html)
- BUGS & ERRORS - [http://eloquentjavascript.net/08_error.html](http://eloquentjavascript.net/08_error.html)
- REGEX - [http://eloquentjavascript.net/09_regexp.html](http://eloquentjavascript.net/09_regexp.html)
- MODULES - [http://eloquentjavascript.net/10_modules.html](http://eloquentjavascript.net/10_modules.html)
- ASYNC PROGRAMMING - [http://eloquentjavascript.net/10_modules.html](http://eloquentjavascript.net/10_modules.html)
- [String Properties/Methods](https://www.w3schools.com/jsref/jsref_obj_string.asp)
- [You Don't Know JS](https://github.com/getify/You-Dont-Know-JS)

## CODE NOTES

#### Some prep work
- Beginners have issues navigating complex resources, applying functionality, lots of practice regarding fundamentals
- Beginners learn the basics at different speeds: need to have everyone at same place to get the most of out of learning

#### Where to write code
- [Codepen](codepen.io) - built in console, test driven development
- [VS Code](https://code.visualstudio.com/), node, npm

### Test Drive Development
- write tests that run your code and compares behavior to expected outcome
- [testem](https://www.npmjs.com/package/testem) in VS Code
  - 2.14.0 seems to lock up and require a `ps aux | grep "testem"` followed by `kill -9 PID`
  - 2.15.0 installed using `npm install testem -g` 
- `mocha` and `chai` 
  - Create folder and `init npm`
  - Install the required modules `npm install --save-dev mocha chai`
  - Create ./test/test.js and add `describe` statements
  - Add `"test": "mocha"` in the scripts section of your package.json
  - Run `npm test`

### [STRICT MODE](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md#strict-mode)
- tighents the rules for certain behaviors
- adhering to strict mode makes your code generally more optimizable by the engine
  - disallows the implicit auto-global variable declaration from omitting var declaration

```javscript
function foo() {
	"use strict";  // the strict code pragma
	// this code is strict mode
	function bar() {
		// this code is strict mode
	}
}
// this code is not strict mode
```

### VALUES & OPERATORS
- `let` creates a variable that can be assigned and reassigned values
- `const` creates a variable that is assigned but can not be reassigned
- expression: any piece of code that resolves to a value

Template Literals
```js
`half of 100 is ${100 / 2}`
// → "half of 100 is 50"
console.log('happy'.length, 'is 5');
// → 5 "is 5"
console.log('happy'.length + 'is 5');
// → "5is 5"
```

UNARY OPERATOR
- Determine a type of a binding
```js
console.log(typeof 4.5)
// → number
console.log(typeof "x")
// → string
```

BOOLEAN VALUES
- the `NaN` value is the only one that would make `x !== x` be true
```js
console.log(3 < 2)
// → false
console.log("Itchy" != "Scratchy")
// → true
console.log("Apple" == "Orange")
// → false
console.log(NaN == NaN)
// → false
console.log(true && false)
// → false
console.log(false || true)
// → true    (always true if something is true with OR)
console.log(false || false)
// → false
```

Logical Operators
- The logical operators && and || handle values of different types in a peculiar way. They will convert the value on their left side to Boolean type in order to decide what to do.

```js
console.log(null || "user")
// → user
console.log("Agnes" || "user")
// → Agnes
```

TERNARY OPERATOR 
- See functions using this...
```javascript
(?:)
```

TYPE CONVERSION
- JavaScript will quietly convert that value to the type it needs, using a set of rules that often aren’t what you want or expect. This is called type coercion

```js
console.log(8 * null)
// → 0
console.log("5" - 1)
// → 4
console.log("5" + 1)
// → 51
console.log("five" * 2)
// → NaN
console.log(false == 0)
// → true
console.log(false === 0)
// → false
console.log(null == undefined);
// → true
console.log(null == 0);
// → false
```

### BINDING / VARIABLES

- bindings must beging with a char, can include number, underscore and dollar sign
- most programmers, follow the bottom style—they capitalize every word except the first
- bindings defined outside of any function or block, the scope is the program or GLOBAL
- Reserved words include: break case catch class const continue debugger default delete do else enum export extends false finally for function if implements import interface in instanceof let new package private protected public return static super switch this throw true try typeof var void while with yield

```javascript
let caught = 5 * 5;
let one = 1, two = 2;
var name = "Ayda";
const greeting = "Hello ";
```

COERSION
- Type coercion is the process of converting value from one type to another (such as string to number, object to boolean, and so on). Any type, be it primitive or an object, is a valid subject for type coercion. To recall, primitives are: number, string, boolean, null, undefined + Symbol
- Explicit - when we define a variable type
- Implicit - when JS defines a variable type

```js
let numString = String(10);
let numNumber = Number(numString);
console.log("String: + typeof numString + " Number:" + typeof numNumber);
let notSure = 10 + "20" + 10*6;
console.log(notSure); // output: 102060

```

EXPLICIT COERCION
```javascript
var a = "42";
var b = Number( a );
a;				// "42"
b;				// 42 -- the number!
```

IMPLICIT COERCION
```javascript
var a = "42";
var b = a * 1;	// "42" implicitly coerced to 42 here
```

FALSY VALUES
- "" (empty string)
- 0, -0, NaN (invalid number)
- null, undefined
- false

TRUTHY VALUES

Any value that's not on this "falsy" list is "truthy." Here are some examples of those:

- "hello"
- 42
- true
- [ ], [ 1, "2", 3 ] (arrays)
- { }, { a: 42 } (objects)
- function foo() { .. } (functions)

EQUALITY
- VALUE EQUALITY `==` `!=` checks for value equality with coercion allowed
- STRICT EQUALITY `===` `!==` checks for value equality without allowing coercion
- comparing objects will only compare the references, not the underlying values!
- INEQUALITY OPERATORS `<`, `>`, `<=`, and `>=`
- comparing a number against anything else will consider a number vs NaN


SCOPE
- lexical scoping: ocal scope can also see all the local scopes that contain it, and all scopes can see the global scope

HOISTING
- using `var` versus `let` to declare a variable will give higher scope to the var

```javascript
function foo() {
	a = 3;
	console.log( a );	// 3
	var a;				// declaration is "hoisted"
						// to the top of `foo()`
}
```


### PROPERTIES / METHODS
- [String Properties/Methods](https://www.w3schools.com/jsref/jsref_obj_string.asp) reference
- <value>.<name of method>(<args>) and different value types have different methods
- without the () you will be asking for the type of the function which is a "function functionName()"

EXAMPLES
- myString.length = length of a string
- myString.toUpperCase(); myString.toLowerCase() 
- Math.max = the maximum function
- num.toFixed() = set a number (float) to a fixed amount of decimals and rount

```js
let doh = "Doh";
console.log(typeof doh.toUpperCase);
// → function
console.log(doh.toUpperCase());
// → DOH

var a = "hello world";
var b = 3.14159;

a.length;				// 11
a.toUpperCase();		// "HELLO WORLD"
b.toFixed(4);			// "3.1416"
```

- Number.isNaN function: Returns True if what's passed doesn’t represent a valid number
```javascript
let theNumber = Number(prompt("Pick a number"));
if (!Number.isNaN(theNumber)) {
  console.log("Your number is the square root of " +
              theNumber * theNumber);
} else {
  console.log("Hey. Why didn't you give me a number?");
}
```



### LOOPS

WHILE LOOP
- will only execute if condition is met
- must approach what will make the while loop false, or it will continue indefinitely
```javascript
let number = 0;
while (number <= 12) {
  console.log(number);
  number = number + 2;
}
// → NO OUTPUT, while loop never executes
```

DO WHILE LOOP
- do loop always executes its body at least once

```javascript
let yourName;
do {
  yourName = prompt("Who are you?");
} while (!yourName);
console.log(yourName);
```

FOR LOOP
- for (counter; text expression; counter change) {}
- can skip a text expression and use a break;
- using `continue;` keyword will skip the rest of that iriteration and test conditions again
- using `break` keyword will end the loop
```javascript
let result = 1;
for (let counter = 0; counter < 10; counter = counter + 1) {
  result = result * 2;
}
console.log(result);
// → 1024
```

- There is a simpler way to write such loops in modern JavaScript!
- with the word `of` after a variable definition, it will loop over the elements of the value given after of. 
- works for arrays, strings and some other data structures.

```javascript
for (let entry of JOURNAL) {
  console.log(`${entry.events.length} events.`);
}
```

SWITCH
- sometimes nested ifs can look better
- must include `break` in each case or fall-through logic happens
- `default:` is the fallback if none are met 

```javascript
switch (prompt("What is the weather like?")) {
  case "rainy":
    console.log("Remember to bring an umbrella.");
    break;
  case "sunny":
    console.log("Dress lightly.");
  case "cloudy":
    console.log("Go outside.");
    break;
  default:
    console.log("Unknown weather type!");
    break;
}
```

### FUNCTIONS 

- Function = a reusable block of code w/ output values, return codes
- pure function: specific kind of value-producing function that has no side effects & doesn’t rely on side effects from other code
- console.log: Output to console in browsers
- Optional Arguments: If a function takers 1 param but you send it 3, it will ignore the 2nd and 3rd
- Missing Arguments: pass too few, the missing parameters get assigned the value `undefined`

FUNCTIONS AS VALUES
```javascript
const square = function(x) {
  return x * x;
};
```

ANONYMOUS FUNCTIONS
 - commonly used, but named function expressions are generally more preferable
```js
let x = function () {}
```

DECLARATION NOTATION FUNCTION
```js
function square(x) {
  return x * x;
}
```

ARROW FUNCTION
arrow functions shorten up syntax
```js
var x = function(x, y) {
  return x * y;
}
const x = (x, y) => x * y;
```
others examples:
```js
const square1 = (x) => { return x * x; };
const square2 = x => x * x;
const horn = () => console.log("Toot");
```

IMMEDIATELY INVOKED FUNCTION EXPRESSIONS (IIFEs)
 - the function is actually treated as a function call
 
```javascript
(function IIFE(){ console.log( "Hello!" ); })();
```

RETURN [TERNARY](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_Operator) OPERATOR (IF) LOGIC

return is based on if variable x exists, if `someCondition ? true return : false return`
```js
const greeting = (x) => { return x ? "Hello " + x + "!" : "Hello!" }
```

to shrink down this example to the barest code:
```js
const greeting = x => x ? `Hello ${x}!` : `Hello!`;
```

OTHER FUNCTION EXAMPLES:
```js
var b = (a > 41) ? "greater than 41" : "less than or eq to 41";
// input string, output if first char is S or s
const doYouPlayTheTheremin = inputString => inputString[0] == 's' || inputString[0] == 'S' ? true : false;
// input two strings, output if 2 last chars are equal
const lastCharacter = (...strings) => strings[0][strings[0].length - 1] === strings[1][strings[1].length - 1];
// input 3 numbers, output the largest number
const maxOfThree = (...numbers) => numbers.sort(function (a, b){return b-a})[0];
```

MISSING ARGUMENTS
- you can handle this by setting arguments in a function
```js
function minus(a, b) {
  if (b === undefined) return -a;
  else return a - b;
}
```

UNLIMITED ARGUMENTS (3 dot notation / spread notation / rest operator)

- function to accept any number of arguments. For example, Math.max computes the maximum of all the arguments it is given
```js
function max(...numbers) {
  let result = -Infinity;
  for (let number of numbers) {
    if (number > result) result = number;
  }
  return result;
}
console.log(max(4, 1, 9, -2));
// → 9
let numbers = [5, 1, 7];
console.log(max(...numbers));
// → 7
```

- Square bracket array notation similarly allows the triple-dot operator to spread another array into the new array.
```js
let words = ["never", "fully"];
console.log(["will", ...words, "understand"]);
// → ["will", "never", "fully", "understand"]
```

- finding length and accessing
```js
const myMnemonic = (...strings) => {
  let output = ;
  //console.log(strings.length, strings);
  for (let x = 0; strings.length > x && x < 4; x++) output = output + strings[x][0];
  return output;
}
```

RECURSION WITH FUNCTIONS
- a function can call itself as long as it won't become a stack overflow / infinity loop
- note: Running through a simple loop is generally cheaper than calling a function multiple times
```js
function power(base, exponent) {
  if (exponent == 0) {
    return 1;
  } else {
    return base * power(base, exponent - 1);
  }
}

console.log(power(2, 3));
// → 8
```


[CLOSURE](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md#closure)

- a way to "remember" and continue to access a function's scope (its variables) even once the function has finished running
```javascript
// CLOSURE - inner function can STILL access values defined in outer function 
//   after the out function is finished running
//   this is because the value is being used so it is kept
// note the variable created are accessible in the scope of the function
console.log('\nCLOSURE');
function getGreeter3(name1) { 
    console.log('i am', name1);
    return function(name2) {
        console.log('Hi',name2 + ', i am',name1);
    }
}
// set name1 in getGreeter3
let introduceNeal = getGreeter3('Neal');
// introduceNeal is now the returned function
introduceNeal('Bob');
```

MODULES
- let you define private implementation details (variables, functions) that are hidden from the outside world
- see a good example with User() and person.login() [here](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md#modules)

PROTOTYPES
- See Your Don't Know JS, Chapters 4-6 of the this & Object Prototypes


[POLYFILLING](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md#polyfilling)
- taking the definition of a newer feature and producing a piece of code that's equivalent to the behavior, but is able to run in older JS environments.
```javascript
if (!Number.isNaN) {
	Number.isNaN = function isNaN(x) { return x !== x; };
}
```
- Use a vetted set of polyfills that you can trust, such as those provided by [ES5-Shim](https://github.com/es-shims/es5-shim) and [ES6-Shim](https://github.com/es-shims/es6-shim)

[TRANSPILING](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md#transpiling)
- use a tool that converts your newer code into older code equivalent
- ES6 adds a feature called "default parameter values." Transpiling will modify/add the code to work with ES5
- Example: 
```javascript
// IN ES6, USE A DEFAULT VALUE
function foo(a = 2) {
	console.log( a );
}
// PRE ES6 EXPLICITLY CHECK FOR A DEFAULT VALUE AND DEFINE IT
function foo() {
	var a = arguments[0] !== (void 0) ? arguments[0] : 2;
	console.log( a );
}
```
- A common transpiler is [Traceur](https://github.com/google/traceur-compiler)

### ARRAYS
ACCESS
- .push = adds to end
- .pop = removes from end
```js
let sequence = [1, 2, 3];
sequence.push(4);
sequence.push(5);
console.log(sequence);
// → [1, 2, 3, 4, 5]
console.log(sequence.pop());
// → 5
console.log(sequence);
// → [1, 2, 3, 4]
```
- .sort = if numbers are sorted as strings, "25" is bigger than "100", because "2" is bigger than "1"

```javascript
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.sort();
```
- .[substr](https://www.w3schools.com/jsref/jsref_substr.asp)
```js
// Use: string.substr(start, length)
const mySlice = (originalString, 
                startIdx = 0, 
                endIdx = originalString.length) => 
    originalString.substr(startIdx, endIdx - startIdx);
```
- .slice = takes start and end indices and returns an array that has elements between. The start index is inclusive, the end index exclusive.
```js
console.log([0, 1, 2, 3, 4].slice(2, 4));
// → [2, 3]
console.log([0, 1, 2, 3, 4].slice(2));
// → [2, 3, 4]
console.log("coconuts".slice(4, 7));
// → nut
```
- .concat = example using .slice and .concat together
```js
function remove(array, index) {
  return array.slice(0, index)
    .concat(array.slice(index + 1));
}
console.log(remove(["a", "b", "c", "d", "e"], 2));
// → ["a", "b", "d", "e"]
```
- .split; .join
```js
let sentence = "Secretarybirds specialize in stomping";
let words = sentence.split(" ");
console.log(words);
// → ["Secretarybirds", "specialize", "in", "stomping"]
console.log(words.join(". "));
// → Secretarybirds. specialize. in. stomping
```
- .indexOf; .lastIndexOf
```js
  console.log([1, 2, 3, 2, 1].indexOf(2));
// → 1
console.log([1, 2, 3, 2, 1].lastIndexOf(2));
// → 3
console.log("coconut".indexOf("u"));
// → 5
console.log("one two three".indexOf("ee"));
// → 11
```
- .trim = method removes whitespace (spaces, newlines, tabs, and similar characters) from the start and end of a string.
```js
console.log("  okay \n ".trim());
// → okay
```
- .padStart
```js
console.log(String(6).padStart(3, "0"));
// → 006
```
- .zeroPad = pad numbers with zeros
```js
let cows = 4;
console.log(`${zeroPad(cows, 3)} Cows`);
// → 004 Cows
```
- .reduce = The [reduce() method](https://www.w3schools.com/jsref/jsref_reduce.asp) reduces the array to a single value.
```
array.reduce(function(total, currentValue, currentIndex, arr), initialValue)
```

- add arbitrary values to an object
```js
let day1 = {
  squirrel: false,
  events: ["work", "touched tree", "pizza", "running"]
};
console.log(day1.wolf);
// → undefined
day1.wolf = false;
console.log(day1.wolf);
// → false
```
- delete operator = cuts off a tentacle from such an octopus
```js
let anObject = {left: 1, right: 2};
console.log(anObject.left);
// → 1
delete anObject.left;
console.log(anObject.left);
// → undefined
console.log("left" in anObject);
// → false
```
- .keys = get keys as an array, without values
```js
console.log(Object.keys({x: 0, y: 0, z: 2}));
// → ["x", "y", "z"]
```

ARRARS: OBJECT REFERENCE VS OBJECT .VALUE
- `object1` and `object2` bindings grasp the same object, which is why changing object1 also changes the value of object2. 
-  `object3` points to a different object, which initially contains the same properties as object1 but lives a separate life.
- Comparing different objects will return `false`, even if they have identical properties.
```js
let object1 = {value: 10};
let object2 = object1;
let object3 = {value: 10};
console.log(object1 == object2);
// → true
console.log(object1 == object3);
// → false
object1.value = 15;
console.log(object2.value);
// → 15
console.log(object3.value);
// → 10
```
- accessing the bindings must be done explicitly
```js
const score = {visitors: 0, home: 0};
// This is okay
score.visitors = 1;
// This isn't allowed
score = {visitors: 1, home: 1};
```

ARRAY OF OBJECTS
- explicitly declare the whole journal
```js
let journal = [
  {events: ["work", "touched tree", "pizza",
            "running", "television"],
   squirrel: false},
  {events: ["work", "ice cream", "cauliflower",
            "lasagna", "touched tree", "brushed teeth"],
   squirrel: false},
  {events: ["weekend", "cycling", "break", "peanuts",
            "beer"],
   squirrel: true},
  /* and so on */
];
```
- declare it and add to it
```js
let journal = [];

function addEntry(events, squirrel) {
  journal.push({events, squirrel});
}
addEntry(["work", "touched tree", "pizza", "running",
          "television"], false);
```
ARRAYS: DESTRUCTING
- Break a passed array down in a function
```js
function phi(table) {
  return (table[3] * table[0] - table[2] * table[1]) /
    Math.sqrt((table[2] + table[3]) *
              (table[0] + table[1]) *
              (table[1] + table[3]) *
              (table[0] + table[2]));
}
```
- Becomes:
```js
function phi([n00, n01, n10, n11]) {
  return (n11 * n00 - n10 * n01) /
    Math.sqrt((n10 + n11) * (n00 + n01) *
              (n01 + n11) * (n00 + n10));
}
```
### ARRAY SEARCHING FOR OBJECTS
My original questions was: [Creating and accessing array of objects in Javascript](https://stackoverflow.com/questions/55544022/creating-and-accessing-array-of-objects-in-javascript/55544101#55544101)




### COMPUTING CORRELATION 
- function that computes the ϕ coefficient from such an array:
```js
function phi(table) {
  return (table[3] * table[0] - table[2] * table[1]) /
    Math.sqrt((table[2] + table[3]) *
              (table[0] + table[1]) *
              (table[1] + table[3]) *
              (table[0] + table[2]));
}
console.log(phi([76, 9, 4, 1]));
// → 0.068599434
```
- extract a two-by-two table for a specific event from the journal, we must loop over all the entries and tally how many times the event occurs
```js
function tableFor(event, journal) {
  let table = [0, 0, 0, 0];
  for (let i = 0; i < journal.length; i++) {
    let entry = journal[i], index = 0;
    if (entry.events.includes(event)) index += 1;
    if (entry.squirrel) index += 2;
    table[index] += 1;
  }
  return table;
}
console.log(tableFor("pizza", JOURNAL));
// → [76, 9, 4, 1]
```
- to compute a correlation for every type of event that occurs in the data set, we need to find every type of event
```js
function journalEvents(journal) {
  let events = [];
  for (let entry of journal) {
    for (let event of entry.events) {
      if (!events.includes(event)) {
        events.push(event);
      }
    }
  }
  return events;
}
console.log(journalEvents(JOURNAL));
// → ["carrot", "exercise", "weekend", "bread", …]
```
- By going over all the events and adding those that aren’t already in there to the events array, the function collects every type of event. Using that, we can see all the correlations.
```js
for (let event of journalEvents(JOURNAL)) {
  console.log(event + ":", phi(tableFor(event, JOURNAL)));
}
// → carrot:         0.0140970969
// → exercise:       0.0685994341
// → weekend:        0.1371988681
// → bread:         -0.0757554019
// → pudding:       -0.0648203724
// → brushed teeth: -0.3805211953
// → candy:          0.1296407447
// → work:          -0.1371988681
// → spaghetti:      0.2425356250
// → reading:        0.1106828054
// → peanuts:        0.5902679812
// and so on
```
- we can manually see the highest two correlations we can combine them to see the correlation
```js
for (let entry of JOURNAL) {
  if (entry.events.includes("peanuts") &&
     !entry.events.includes("brushed teeth")) {
    entry.events.push("peanut teeth");
  }
}
console.log(phi(tableFor("peanut teeth", JOURNAL)));
// → 1
```


### JSON: JavaScript Object Notation

- JSON.stringify and JSON.parse

```js
let string = JSON.stringify({squirrel: false,
                             events: ["weekend"]});
console.log(string);
// → {"squirrel":false,"events":["weekend"]}
console.log(JSON.parse(string).events);
// → ["weekend"]
```

### MATH FUNCTION
- Math.max (maximum)
- Math.min (minimum)
- Math.sqrt (square root)
- Math.PI
- Math.random (decimal)
- Math.floor (rounds down to the nearest whole number) 
```js
console.log(Math.floor(Math.random() * 10));
// → 2
// Result will be between 0 and 9
```






[[edit](https://github.com/nealalan/nealalan.github.io/)]
