using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = dcc_radioitems(
  options =[
    Dict("label" => "New York City", "value" => "NYC"),
    Dict("label" => "Montréal", "value" => "MTL"),
    Dict("label" => "San Francisco", "value" => "SF")
  ],
  value="MTL",
  labelStyle=Dict("display" => "inline-block")
)

run_server(app, "0.0.0.0", debug=true)