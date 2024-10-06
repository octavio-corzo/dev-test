const sentence = 'Hola Mundo. Adios Mundo';

const reverseWords = (sentence) => {
    const sentences = sentence.split('.').map(res => res.trim()).filter(Boolean);

    const reverSentences = sentences.reverse().map(res => {
        const words = res.split(' ').filter(Boolean);
        return words.reverse().join(' '); 
    });

    return reverSentences.join('. ').trim();
};


console.log(reverseWords(sentence));