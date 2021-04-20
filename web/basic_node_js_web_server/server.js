'use strict';

/* Libraries */
const express = require('express');
const app = express();

const PORT = 8080;
let counter = 0;

app.use(express.json())
app.use(express.static('public'));

const incrementCounter = i => counter += i;

const decrementCounter = i => counter -= i;

app.get('/', (req, res) => {
    res.redirect('./index.html');
});

app.get('/hello/:user', (req, res) => {
    res.send(`Hello, ${req.params.user}`);
});

app.get('/counter', (req, res) => {
    res.send(JSON.stringify({ counter }));
});

app.post('/increment/counter', (req, res) => {
    const response = { counter: incrementCounter(Number(req.body.increment)) };
    res.send(JSON.stringify(response));
})

app.post('/decrement/counter', (req, res) => {
    res.send({ counter: decrementCounter(Number(req.body.decrement)) });
})

app.listen(PORT, () => {
    console.log(`Listening on ${PORT}`)
});
