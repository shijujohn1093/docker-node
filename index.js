const express = require('express');
const redis = require('redis');
const process = require('process');

const app  = express();
const redisClient = redis.createClient({
    host: 'redis-server',
    port: 6379
});

redisClient.set('visits', 0)

app.get('/health', (req, res) => {
    res.send('Hi There');
});

/**
 * process.exit(0)
 * 0: WE exited everything is ok
 * 1,2,3,4, etc: we exit becuase something went wrong
 */
app.get('/kill', (req, res) => {
    process.exit(1);
});


app.get('/', (req, res) => {
    redisClient.get('visits', (err, visits) => {
        redisClient.set('visits', parseInt(visits)+1)
        res.send('Number of visit is '+visits);
    });
});

app.listen(8081, () => {
    console.log('Listening on port 8081');
});