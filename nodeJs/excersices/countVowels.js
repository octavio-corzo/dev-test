const vowels = {
    a: 0,
    e: 0,
    i: 0,
    o: 0,
    u: 0
};
const data = "Holaaaaaa, cómo estás? how are you today?";

const countVowels = (vowel) => {
    const lowerVowel = vowel.toLowerCase();

    for (let char of lowerVowel) {
      if (vowels.hasOwnProperty(char)) {
        vowels[char]++;
      }
    };
    return vowels;
};

console.log(countVowels(data)); 