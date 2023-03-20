const express = require('express');

const app = express();

app.get('/', (req, res) => {
    res.send('hi')
})

app.get('/status', (req, res) => {
    res.send('The server is alive');
})

app.get('/json', (req, res) => {
    const resp = {
        property1: "value1",
        property2: "value2"
    };
    res.json(resp);
})

const data = {
    users: []
}

// Use POST to add a user
app.post('/users', (req, res) => {
    let newUser = {
        name: 'Phyllis',
        age: 68
    }
    data.users.push(newUser)
    res.send(newUser);
});

// Use GET to retrieve a list of all users
app.get('/users', (req, res) => {
    res.send(data.users);
})

const port = 5000;
app.listen(port, () => console.log(`Server is listening on port ${port}.`));