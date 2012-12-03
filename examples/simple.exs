# Run this app from root with:
#
#     mix run -r examples/simple.exs --no-halt
#
Code.prepend_path("deps/ranch/ebin")
Code.prepend_path("deps/cowboy/ebin")

Dynamo.start(:prod)

defmodule MyDynamo do
  use Dynamo.Router
  use Dynamo

  config :dynamo,
    compile_on_demand: false

  config :server,
    port: 3030

  get "/foo/bar" do
    conn.resp_body("Hello World!")
  end
end

MyDynamo.start.run