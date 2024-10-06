const input = "HOLA MUNDO MARAVILLOSO";

const capitalizeFirstLetters = (argument) => {
  return argument.split(' ').map(word => {
    if (word.length > 5) {
      word = word.split('').reverse().join('');
    };
    return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
  });
}

console.log(capitalizeFirstLetters(input)); 