const express = require('express');

const app = express();

app.get('/', (req, res) => {
    res.end('hi')
})

app.get('/status', (req, res) => {
    res.end('The server is alive');
})

const port = 5000;
app.listen(port, () => console.log(`Server is listening on port ${port}.`));