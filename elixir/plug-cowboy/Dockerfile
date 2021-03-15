FROM elixir:1.11.3-alpine
RUN apk add build-base
WORKDIR /app
COPY . /app
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get \
    && mix deps.compile \
    && MIX_ENV=prod mix distillery.release \
    && rm -rf /app/_build/prod/rel/plug_cowboy_app/etc

FROM elixir:1.11.3-alpine
WORKDIR /app
EXPOSE 8080
RUN apk update && apk upgrade && apk add bash
COPY --from=0 /app/_build/prod /app
ENTRYPOINT exec /app/rel/plug_cowboy_app/bin/plug_cowboy_app foreground
