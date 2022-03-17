import Config

config :soulless,
  uid: System.get_env("MAJSOUL_UID"),
  access_token: System.get_env("MAJSOUL_TOKEN"),
  region: :en

if config_env() == :test do
  config :soulless,
    region: :test
end
