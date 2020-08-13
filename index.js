const server = require('./server.js');
const helmet = require( "helmet" );

const PORT = process.env.PORT || 5000;

server.use( helmet() );

server.listen(PORT, () => {
  console.log(`Listening on port ${PORT}...`);
});