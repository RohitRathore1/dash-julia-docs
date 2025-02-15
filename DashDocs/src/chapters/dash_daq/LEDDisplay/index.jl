@doc_chapter "/dash-daq/leddisplay" begin

@example leddisplay_default "default.jl"
@example leddisplay_backgroundcolor "background_color.jl"
@example leddisplay_color "color.jl"
@example leddisplay_label "label.jl"
@example leddisplay_size "size.jl"

@layout html_div() do

    html_h1("LED display Examples and Reference"),

    html_h3("Default LED display"),

    dcc_markdown("An example of a default LED display without any extra properties."),

    source"leddisplay_default",
    layout"leddisplay_default",

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    source"leddisplay_label",
    layout"leddisplay_label",

    html_h3("Size"),

    dcc_markdown("""
    Adjust the size of the LED display with `size`.
    """),

    source"leddisplay_size",
    layout"leddisplay_size",

    html_h3("Color"),

    dcc_markdown("""
    Adjust the color of the LED display with `color=#<hex_color>`
    """),

    source"leddisplay_color",
    layout"leddisplay_color",

    html_h3("Background Color"),

    dcc_markdown("""
    Adjust the background color of the LED display using: `backgroundColor=#<hex_color>`
    """),

    source"leddisplay_backgroundcolor",
    layout"leddisplay_backgroundcolor",

    html_h3("LED Display Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_leddisplay
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_leddisplay))

end

end