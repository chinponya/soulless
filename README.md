# Soulless

Unofficial Mahjong Soul game API client for elixir.

**This is an early prototype and should not be used for anything serious**

## Installation

The package can be installed by adding the following to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:soulless, :github, "chinponya/soulless"}
  ]
end
```

## Using

Interfacing with the library happens in two ways: by calling wrappers for RPC functions, with the appropriate data, and through callbacks invoked by the library when the server sends us a message.

First, it's advised to create a new module where the callbacks will be implemented.
The `message` parameter will be one of the structs under `Soulless.Lq`.
User's implementation should pattern match on these structs in order to handle the appropriate events.
Don't forget to also implement a catch-all handler, so the process doesn't crash.
File implementing them is auto generated and quite long, so it is easier to explore the available options in `iex` shell or through the `priv/protos/majsoul.proto`.

An example implementation could look like this.

```elixir
defmodule Majsoul.Client do
  use Soulless.Client
  require Logger

  # This callback is invoked after the client connects and logs in successfully.
  def handle_ready(state) do
    Logger.info("Client ready")

    # Example of creating a new request to the `Lobby` service.
    Soulless.Lobby.fetchGameRecordList(
      # First argument expects a PID. The macro assigns a global name that matches __MODULE__,
      # so in the case of creating requests from other processes we can use `Majsoul.Client` instead.
      self(),
      # Second argument should contain a corresponding request struct. You can find out which one you need
      # by looking at the `Soulless.Lobby` module or the `priv/protos/majsou.proto` file.
      %Soulless.Lq.ReqGameRecordList{start: 1, count: 10, type: 0}
    )

    {:ok, state}
  end

  # This callback is invoked when the server sends us an expected response to something we submitted.
  # The types for such messages are always prefixed with `Res` for "response".

  # Pattern match on the response struct we are interested in.
  def handle_response(%ResGameRecordList{} = message, state) do
    IO.puts("There are #{message.total_count} game logs on this account")
    {:ok, state}
  end

  def handle_response(message, state) do
    Logger.info("Catch-all response handler received: #{inspect(message)}")
    {:ok, state}
  end

  # This callback is invoked when the server sends us a notice.
  # The types for such messages are always prefixed with `Notice`.
  def handle_notice(%Soulless.Lq.NotifyFriendStateChange{} = message, state) do
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

## Configuration 

This library needs the user ID and token in order to authenticate.
These can be obtained by extracting values from the response made to `https://passport.mahjongsoul.com/user/login` during the login operation.
The relevant fields are `uid` and `token` (not to be confused with `access_token`).
In addition, we also need to specify a `region`. Currently only `:en` is supported.

These values should be provided either in the global configuration or via `Soulless.Client.start_link()`.

For global configuration this should look like so (note that all instances will share the global configuration):

```elixir
# config/config.exs
import Config

config :soulless,
  uid: "123456",
  access_token: "effeffeffeffeffeffeffeffeffeff",
  region: :en
```

And for `Soulless.Client.start_link()`:

```elixir
{:ok, pid} = Soulless.Client.start_link(%{
  uid: "123456",
  access_token: "effeffeffeffeffeffeffeffeffeff",
  region: :en
})
```

Or similarly, in a supervisor:

```elixir
defmodule Soulless.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Soulless.Client, %{
        uid: "123456",
        access_token: "effeffeffeffeffeffeffeffeffeff",
        region: :en
      }}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
```
