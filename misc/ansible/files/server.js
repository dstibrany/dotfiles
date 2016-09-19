var express = require('express');
var app = express();
var morgan = require('morgan')

app.use(morgan('short'))

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.listen(3000, function () {
  console.log('listening on port 3000');
});