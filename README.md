# Ashie – Experimental version of Lissie using the [Ash Framework](https://ash-hq.org)

## Current status

- Created a new web app with the Igniter code generator:

```mix igniter.new ashie --install ash,ash_postgres,ash_phoenix --with phx.new```

- Ran the Ash code generator to create a new Student resource:

```mix ash.gen.resource Ashie.Students.Student --extend postgres --attribute student_id:string:primary_key --attribute firstname:string:required --attribute lastname:string:required --timestamps```

- Edited the generated code to add constraints and to change the datatype to `citext` (PostgresSQL) for all attributes

## Check your setup by running the app

Run `mix compile` and `mix test`.

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
