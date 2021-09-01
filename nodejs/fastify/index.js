const fastify = require('fastify')({ logger: false })
const {init} = require('./setup');

const port = process.env.PORT || 8080;

init(fastify);

const start = async () => {
  try {
    await fastify.listen(port, '0.0.0.0');
    console.log(`Server started in port ${port}`);
  } catch (err) {
    fastify.log.error(err)
    process.exit(1)
  }
}
start()