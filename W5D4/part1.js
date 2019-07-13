function mysteryScoping1() { // in block , in block
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping2() { // in block , out of block 
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping3() { //x is already defined ... 
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping4() { //in block , out of block
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping5() { //x is already declared
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}


function madLib(verb, adj, noun) {
    console.log(`We shall ${verb} the ${adj} ${noun}`)
}

function isSubstring(searchString, subString) {
    return searchString.includes(subString)
    //iter over string
}
// isSubstring("asfdhelloasfd", "hello")

function fizzBuzz(arr) {
    let res = [];
    arr.forEach(element => {
        if ((element % 3 === 0) ^ (element % 5 === 0))  {           
        res.push(element) 
            }
    });
    return res
}

function isPrime(number) {
    if (number < 2) { return false }
    for (let i = 2; i < number; i++) {
        if (number % i === 0) { return false }
    }
    return true
    //range
}

function sumOfPrimes (n) {
    let count = 0
    let sum = 0
    let i = 2
    while (count < n) {
        if (isPrime(i)) {
            sum += i
            count++
        }
    i ++
    }   
    return sum
}

sumOfPrimes(5)