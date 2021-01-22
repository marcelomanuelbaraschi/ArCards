defmodule ArCards.Repo do
  use Ecto.Repo,
    otp_app: :ar_cards,
    adapter: Ecto.Adapters.Postgres
end
