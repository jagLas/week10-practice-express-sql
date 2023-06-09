const express = require('express');
require('express-async-errors')
const app = express();
const dogRouter = require('./routes/dogs.js')

app.use('/static', express.static('assets'));

app.use(express.json());

app.use((req, res, next) => {
  console.log(req.method, req.url);
  res.on('finish', () => {
    // read and log the status code of the response
    console.log(res.statusCode);
  });
  next();
})

app.use('/dogs', dogRouter);

// For testing purposes, GET /
app.get('/', (req, res) => {
  res.json("Express server running. No content provided at root level. Please use another route.");
});

// For testing express.json middleware
app.post('/test-json', (req, res, next) => {
  // send the body as JSON with a Content-Type header of "application/json"
  // finishes the response, res.end()
  res.json(req.body);
  next();
});

// For testing express-async-errors
app.get('/test-error', async (req, res) => {
  throw new Error("Hello World!")
});

app.use((req, res, next) => {
  const err = new Error('The requested resource could not be found');
  err.statusCode = 404;
  next(err);
})

app.use((err, req, res, next) => {
  console.log(err);
  res.status(err.statusCode || 500);
  res.body = {
    message: "Something went wrong",
    statusCode: err.statusCode,
  }

  if(process.env.NODE_ENV !== 'production') {
    res.body.stack = err.stack;
  }
  res.json(res.body);
})

const port = 5000;
app.listen(port, () => console.log('Server is listening on port', port));
console.log(process.env.NODE_ENV)