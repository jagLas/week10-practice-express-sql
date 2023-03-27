const express = require('express');
const app = express();
// Your code here
app.use(express.static('assets'));


const port = 5000;
app.listen(port, () => console.log('Server is listening on port', port));