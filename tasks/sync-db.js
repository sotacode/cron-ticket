let times = 1;

const syncDB = () => {
    console.log('Every 5 second. Number tick: ',times);
    times++;
    return times
}

module.exports = {
    syncDB
}