// function titleize(array) {
//     new_array = array.map(element => {
//         `Mx. ${element} Jingleheimer Schmidt`
//     })
//     new_array.forEach(element => {
//         console.log(element)
//     })
//     Array.prototype.forEach(function(el) => {
//         console.log(el)
//     }, el)
// }

function titleize (array, callback) {
    
    let titled = array.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    callback(titled);
}

// titleize(["John", "Mary"], function (arr) { arr.forEach( el => { console.log(el)}) })

class Elephant {
    constructor(name, height, tricks) {
    this.name = name
    this.height = height
    this.tricks = tricks
    }
}

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`)
}

Elephant.prototype.grow = function() {
    this.height = this.height + 12
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick)
}

Elephant.prototype.play = function() {
    const trick = this.tricks[Math.floor(Math.random() * this.tricks.length)]
    console.log(`${this.name} is ${trick}`)
}

const dumbo = new Elephant("Dumbo", 38, ["Reading a book", "Eating a coconut"])
// dumbo.trumpet()
// dumbo.grow()
// console.log(dumbo.height)
// dumbo.addTrick("Balancing a ball")
// dumbo.play()
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
    console.log(`${elephant.name} is trotting by!`)
}

// herd.forEach(Elephant.paradeHelper)

function dinerBreakfast() {
    let order = ["I would like cheesy scrambled eggs please"]
    return function(food) {
        order = `${order.slice()} and ${food} please`
        console.log(order)
    }
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");