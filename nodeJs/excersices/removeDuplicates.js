const users = [
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' },
    { id: 1, name: 'Alice' }
];

const removeDuplicates = (data) => {
    const user = {};
    
    for (let i = data.length - 1; i >= 0; i--) {
        const item = data[i];
        if (!user[item.id]) {
            user[item.id] = true;
        } else {
            data.splice(i, 1); 
        }
    }

    return data;
}

console.log(removeDuplicates(users)); 