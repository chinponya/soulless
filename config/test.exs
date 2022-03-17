import Config

config :soulless,
  region: {:custom, [address: "localhost", port: 8081, ssl: false]}

config :soulless, Soulless.MockServer,
  port: 8081,
  router: Soulless.MockServer.Router,
  socket: Soulless.MockServer.Socket
