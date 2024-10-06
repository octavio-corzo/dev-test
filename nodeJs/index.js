//----------------------------------------------------------------------
/// getAverage
//----------------------------------------------------------------------
const getAverage = (data) => {
  let sum = 0;
  let count = 0;

  data.forEach(item => {
    if (typeof item === 'number') {
      sum += item;
      count++;
    } else if (typeof item === 'object' && item !== null) {
      for (let key in item) {
        if (typeof item[key] === 'number') {
          sum += item[key];
          count++;
        }
      }
    }
  });
  return count === 0 ? 0 : sum / count;
};

const array = [{ value: 10 }, 20, 30, { value: 40 }, 50];
console.log(getAverage(array));

//----------------------------------------------------------------------
//reverseWords
//----------------------------------------------------------------------
const reverseWords = (sentence) => {
  const sentences = sentence.split('.').map(res => res.trim()).filter(Boolean);

  const reverSentences = sentences.reverse().map(res => {
    const words = res.split(' ').filter(Boolean);
    return words.reverse().join(' ');
  });

  return reverSentences.join('. ').trim();
};

const sentence = 'Hola Mundo. Adios Mundo'
console.log(reverseWords(sentence));

//----------------------------------------------------------------------
//countVowels
//----------------------------------------------------------------------

const vowels = {
  a: 0,
  e: 0,
  i: 0,
  o: 0,
  u: 0
};

const countVowels = (vowel) => {
  const lowerVowel = vowel.toLowerCase();

  for (let char of lowerVowel) {
    if (vowels.hasOwnProperty(char)) {
      vowels[char]++;
    }
  };
  return vowels;
};

const data = "Holaaaaaa, cómo estás? how are you today?";
console.log(countVowels(data));

//----------------------------------------------------------------------
//removeDuplicates
//----------------------------------------------------------------------

const users = [
  { id: 1, name: 'Alice' },
  { id: 2, name: 'Bob' },
  { id: 1, name: 'Alice' }
];

const removeDuplicates = (data) => {
  const user = {};
  const uniqueUser = [];

  for (item of data) {
    if (!user[item.id]) {
      user[item.id] = true;
      uniqueUser.push(item);
    }
  }

  return uniqueUser;
}

console.log(removeDuplicates(users));

//----------------------------------------------------------------------
//capitalizeFirstLetters
//----------------------------------------------------------------------

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