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