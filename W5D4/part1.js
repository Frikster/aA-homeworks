function madLib(verb, adjective, noun){
  return "We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}."
}

function isSubstring(searchString, subString){
  return searchString.includes(subString)
}

function fizzBuzz(array){
  var res = [];
  array.forEach(function (num) {
  if(((num % 3) === 0) ^ ((num % 5) === 0)) {
    res + num;
  }
  });
  return res;
}

function isPrime(num){
  if(num <= 1){ return false}
  for(let i = 2; i < num; i++){
    if(num % i === 0){
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n){
  let num = 1;
  let total = 0;
  while(n != 0){
    if(isPrime(num)){
      total+=num;
      n--;
    }
    num++;
  }
  return total;
}
