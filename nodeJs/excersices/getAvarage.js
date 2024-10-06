const array = [{ value: 10 }, 20, 30, { value: 40 }, 50];

const  getAverage = (data) => {
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

console.log(getAverage(array));