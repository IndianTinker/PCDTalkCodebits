const { Client} = require('node-osc');

const val= 0.7

const client = new Client('127.0.0.1', 9100);
client.send('/hello/1', val, () => {
  client.close();
});

const client2 = new Client('127.0.0.1', 9000);
client2.send('/hello/1', val, () => {
  client2.close();
});