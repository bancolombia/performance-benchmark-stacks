module.exports = function (fastify, opts, done) {
  fastify.get("/status", (req, reply) => {
    reply.send({ status: "UP" });
  });

  done();
};
