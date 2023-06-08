# Soulless

Unofficial Mahjong Soul game API client for elixir.

**This is an early prototype and should not be used for anything serious**

## Installation

The package can be installed by adding the following to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:soulless, "~> 0.1"}
  ]
end
```

## Using

Interfacing with the library happens in two ways: by calling wrappers for RPC functions, with the appropriate data, and through callbacks invoked by the library when the server sends us a message.

First, it's advised to create a new module where the callbacks will be implemented.
The `message` parameter will be one of the structs under `Soulless.Game.Lq` - for the game client or `Soulless.Tourney.Lq` - for the tournament management site client.
User's implementation should pattern match on these structs in order to handle the appropriate events.
Don't forget to also implement a catch-all handler, so the process doesn't crash.
File implementing the structs is auto generated and quite long, so it is easier to explore the available options in `iex` shell or through the `priv/protos/majsoul.proto` and `priv/protos/tourney.proto`.

An example implementation could look like this.

```elixir
defmodule Majsoul.Client do
  use Soulless.Game.Client # or Soulless.Tourney.Client
  require Logger

  # This callback is invoked after the client connects and logs in successfully.
  def handle_ready(state) do
    Logger.info("Client ready")

    # Example of creating a new request to the `Lobby` service.

    # Pass a corresponding request struct to a service you want to send it to. 
    # You can find out which one you need by looking at the `Soulless.Lobby` module
    # or the `priv/protos/majsou.proto` file.
    %Soulless.Game.Lq.ReqGameRecordList{start: 1, count: 10, type: 0}
    |> Soulless.Game.Service.Lobby.fetch_game_record_list()
    # Next, pass it to `Soulless.RPC.send/2` with client's PID in order to actually send it.
    |> Soulless.RPC.send(self())

    {:ok, state}
  end

  # This callback is invoked when the server sends us an expected response to something we submitted.
  # The types for such messages are always prefixed with `Res` for "response".

  # Pattern match on the response struct we are interested in.
  def handle_response(%Soulless.Game.Lq.ResGameRecordList{} = message, state) do
    IO.puts("There are #{message.total_count} game logs on this account")
    {:ok, state}
  end

  def handle_response(message, state) do
    Logger.info("Catch-all response handler received: #{inspect(message)}")
    {:ok, state}
  end

  # This callback is invoked when the server sends us a notice.
  # The types for such messages are always prefixed with `Notice`.
  def handle_notice(%Soulless.Game.Lq.NotifyFriendStateChange{} = message, state) do
    message_prefix = "Our friend UID #{message.active_state.account_id}"

    case {message.active_state.is_online, message.active_state.playing} do
      {false, _} -> IO.puts(message_prefix <> " logged out")
      {true, nil} -> IO.puts(message_prefix <> " is online")
      {true, _} -> IO.puts(message_prefix <> " joined a match")
    end

    {:ok, state}
  end

  def handle_notice(message, state) do
    Logger.info("Catch-all notice handler received: #{inspect(message)}")
    {:ok, state}
  end
end
```

Note that the above example showcased how to create requests from the `handle_ready/1` handle, where requests
are required to not block the GenServer. In most cases, it's going to be easier to just create requests from
the outside. For this task, we need to use `Soulless.RPC.fetch/2` function.

```elixir
# Pass a corresponding request struct to a service you want to send it to. 
# You can find out which one you need by looking at the `Soulless.Lobby` module
# or the `priv/protos/majsou.proto` file.
response = 
  %Soulless.Game.Lq.ReqGameRecordList{start: 1, count: 10, type: 0}
    |> Soulless.Game.Service.Lobby.fetch_game_record_list()
    # Next, pass it to `Soulless.RPC.fetch/2` in order to actually send it.
    # It expects a PID, but the macro assigns a global name that matches __MODULE__,
    # so in this case we can use `Majsoul.Client` instead.
    |> Majsoul.Client.fetch()

# do something with `response` which in this case will be of type `%Soulless.Lq.ResGameRecordList{}`
...
```


## Configuration 

This library needs the user ID and token in order to authenticate.
These can be obtained by extracting values from the response made to `https://passport.mahjongsoul.com/user/login` during the login operation. At this point have two options:

1. Use `uid` and `token`. This `token` is permanent and will never change.
When using `token`, you also need to configure `token_kind` to `:permanent`.
In addition, we also need to specify a `region`. Currently only `:en` is supported.

```elixir
# config/config.exs
import Config

config :soulless,
  uid: "1234567",
  access_token: "effeffeffeffeffeffeffeffeffeff",
  token_kind: :permanent,
  region: :en
```

**IMPORTANT**
This method will call the `https://passport.mahjongsoul.com` endpoint, which as of 2022-04-04 is placed behind the Imperva WAF (Web Application Firewall).
As a result, you can get temporarily IP banned. For this reason, the second method is recommended.

2. Use `uid` and `accessToken`. This `accessToken` will change when another session takes its place.
This can happen when another client logs into your account at the same time, invalidating the old token.
When using `accessToken`, you also need to configure `token_kind` to `:transient`.
In addition, we also need to specify a `region`. Currently only `:en` is supported.

```elixir
# config/config.exs
import Config

config :soulless,
  uid: "1234567",
  access_token: "deedeedeedeedeedeedeedeedeedee",
  token_kind: :transient,
  region: :en
```

This method will bypass requests a request to `https://passport.mahjongsoul.com`, effectively skipping the WAF.
Only downside is that you will need to manually update the token when it expires.


For either method, it is also possible to set these values via `{YourModule}.start_link()`.

```elixir
{:ok, pid} = Majsoul.Client.start_link(%{
  uid: "1234567",
  access_token: "effeffeffeffeffeffeffeffeffeff",
  token_kind: :permanent, # or :transient
  region: :en
})
```

Or similarly, in a supervisor:

```elixir
defmodule Soulless.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Majsoul.Client, %{
        uid: "123456",
        access_token: "effeffeffeffeffeffeffeffeffeff",
        token_kind: :permanent, # or :transient
        region: :en
      }}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
```
