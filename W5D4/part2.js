function titleize(array, cb){
  let titleized = array.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  cb(titleized)
}

// titleize(["Mary", "Brian", "Leo"], (names) => {
//   names.forEach(name => console.log(name));
// })

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}


Elephant.prototype.trumpet = () => {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = () => {
  this.height += 12;
};

Elephant.prototype.addTrick = (trick) => {
  this.tricks.push(trick);
};

Elephant.prototype.play = () => {
  console.log(this.tricks[Math.random() * this.tricks.length]);
};

// And I've run out of time... And am confused as to why the above does not work
