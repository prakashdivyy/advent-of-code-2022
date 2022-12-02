const fs = require('fs');
const readline = require('readline');

const file = readline.createInterface({
    input: fs.createReadStream('input.txt'),
    output: process.stdout,
    terminal: false
});

const result = fs.createWriteStream('output.txt', {
    flags: 'a'
});

const mapper = {
    "X": "A",
    "Y": "B",
    "Z": "C"
};

const point = {
    "A": 1,
    "B": 2,
    "C": 3
};

const lose = {
    "A": "B",
    "B": "C",
    "C": "A"
};

file.on('line', (line) => {
    const [p1, p2] = line.split(" ");
    const transformed = mapper[p2];
    let score = point[transformed];
    if (transformed === p1) {
        score += 3;
    } else if (lose[transformed] !== p1) {
        score += 6;
    }
    result.write(score + "\n");
});