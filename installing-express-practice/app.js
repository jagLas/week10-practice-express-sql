const express = require('express');

const app = express();

app.get('/', (req, res) => {
    res.end('Hello there!')
})

const port = 5000;
app.listen(port, () => console.log(`Server is listening on port ${port}.`));