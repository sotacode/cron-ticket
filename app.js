const cron = require('node-cron');

let times = 1;

cron.schedule('1-59/5 * * * * *', () => {
  console.log('Every 5 second. Number tick: ',times);
  times++;
});