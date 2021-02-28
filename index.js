// const jsonServer = require('json-server');
// const server = jsonServer.create();
// const router = jsonServer.router('db.json');
// const middlewares = jsonServer.defaults();
// const port = process.env.PORT || 3000;

// server.use(middlewares);
// server.use(router);

// server.listen(port);
///////////

const express = require('express');
const app = express();
const data = require('./db.json');
let port = process.env.PORT || 3000;


app.get('/',(req,res)=>{
    res.send(data);
})

app.listen(port,()=>{
    console.log(`this example is listening on ${port}`)
})