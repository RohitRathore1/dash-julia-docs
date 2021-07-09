# initialize outermost container Dash app
include("app.jl");

using Pkg
Pkg.develop(path="./dash-user-guide-components")

using Dash, DashCoreComponents, DashHtmlComponents, DashUserGuideComponents, DashDaq, Match

# Load Chapter, Example, Header, Section, Syntax components
map(include, filter(x->occursin(r".jl$", x), readdir("dash_docs/reusable_components/", join=true)));

# Load chapter container Dash apps
# remove unused includes to speed up load time in development
include("dash_docs/chapters/whats_dash/introduction.jl");
include("dash_docs/chapters/installation/index.jl");
include("dash_docs/chapters/getting_started/index.jl");
include("dash_docs/chapters/basic_callbacks/index.jl");
include("dash_docs/chapters/graph_crossfiltering/index.jl");
include("dash_docs/chapters/sharing_data/index.jl");
include("dash_docs/chapters/faq_gotchas/index.jl");
include("dash_docs/chapters/deployment/index.jl");

include("dash_docs/chapters/dash_core_components/index.jl");
include("dash_docs/chapters/dash_core_components/Dropdown/index.jl");
include("dash_docs/chapters/dash_core_components/Slider/index.jl");
include("dash_docs/chapters/dash_core_components/RangeSlider/index.jl");
include("dash_docs/chapters/dash_core_components/Input/index.jl");
include("dash_docs/chapters/dash_core_components/Textarea/index.jl");
include("dash_docs/chapters/dash_core_components/Checklist/index.jl");
include("dash_docs/chapters/dash_core_components/RadioItems/index.jl");
include("dash_docs/chapters/dash_core_components/DatePickerSingle/index.jl");
include("dash_docs/chapters/dash_core_components/DatePickerRange/index.jl");
include("dash_docs/chapters/dash_core_components/Markdown/index.jl");
include("dash_docs/chapters/dash_core_components/Tabs/index.jl");

include("dash_docs/chapters/dash_html_components/index.jl");

include("dash_docs/chapters/dash_daq/index.jl");
include("dash_docs/chapters/dash_daq/BooleanSwitch/index.jl");
include("dash_docs/chapters/dash_daq/ColorPicker/index.jl");
include("dash_docs/chapters/dash_daq/DarkThemeProvider/index.jl");
include("dash_docs/chapters/dash_daq/Gauge/index.jl");

for example in chapters_callbacks.examples
    example.callback!(app)
end

for example in chapters_interactive_graphing.examples
    example.callback!(app)
end

for example in chapters_sharing_data.examples
    example.callback!(app)
end

for example in chapters_dash_core_components.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_dropdown.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_slider.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_rangeslider.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_input.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_textarea.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_datepickersingle.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_datepickerrange.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_tabs.examples
    example.callback!(app)
end

for example in chapters_dash_html_components.examples
    example.callback!(app)
end

for example in chapters_dash_daq.examples
    example.callback!(app)
end

for example in chapters_dash_daq_booleanswitch.examples
    example.callback!(app)
end

for example in chapters_dash_daq_colorpicker.examples
    example.callback!(app)
end

for example in chapters_dash_daq_darkthemeprovider.examples
    example.callback!(app)
end

for example in chapters_dash_daq_gauge.examples
    example.callback!(app)
end

header = html_div(
    children = (
        html_div(
            style = Dict("height" => "95%"),
            className = "container-width",
            children = (
                html_div(
                    children = (
                        html_span("📣 Welcome! Dash for Julia is New! Read "),
                        html_a("the community announcement", className = "link", href="https://community.plotly.com/t/welcome-to-dash-julia/46056"),
                        html_span(" regarding the current status of the project.")
                    ),
                    style = Dict("background-color" => "#80CFBE", "text-align" => "center", "color" => "#000000")),
                html_a(
                    html_img(
                        style = Dict("height" => "100%", "padding-left" => "80px"),
                        src = "https://dash.plotly.com/assets/images/logo-plotly.png"
                        ),
                        href = "https://plotly.com/products/dash",
                        className = "logo-link"
                        ),
                        html_div(
                            children = (
                                html_a("Announcements", className = "links--announcements", href = "https://community.plotly.com/tag/announcements"),
                                html_a("Gallery", className = "links--gallery", href = "https://dash-gallery.plotly.host"),
                                html_a("Show & Tell", className = "links--show-and-tell", href = "https://community.plotly.com/tag/show-and-tell"),
                                html_a("Community Forum", className = "links--community-forum", href = "https://community.plotly.com/c/dash/julia/20"),
                                html_iframe(src="https://ghbtns.com/github-btn.html?user=plotly&repo=dash.jl&type=star&count=true&size=small", style = Dict("border" => "none", "height" => "30px", "verticalAlign" => "middle", "marginTop" => "9px", "width" => "120px")),
                                html_a("dash enterprise demo", className = "link--demo-button", href = "https://plotly.com/get-demo/?utm_source=docs&utm_medium=banner&utm_campaign=sept&utm_content=demo", style = Dict("backgroundColor" => "#f4564e", "borderRadius" => "1.22rem", "color" => "white", "cursor" => "pointer", "display" => "inline-block", "fontStyle" => "italic", "fontWeight" => "700", "lineHeight" => "1.2", "letter-spacing" => "1.33px", "outline" => "none", "padding" => ".55rem 1.22rem", "marginRight" => "5px", "textAlign" => "center", "verticalAlign" => "middle", "textDecoration" => "none", "textTransform" => "uppercase", "transition" => "background-color .2s ease-in-out"))
                                ),
                            className = "links"
                        )
                    )
        )
    ),
    className = "header"
);

app.layout = html_div() do
    html_div(id = "wait-for-layout"),
    dcc_location(id = "url", refresh=false),
    header,
    html_div(
        className = "content-wrapper",
        children = (
            html_div(
                (
                    html_div(id = "backlinks-top", className = "backlinks"),
                    html_div(
                        html_div(id = "chapter", className = "content"), # the children of this component is the layout of a dash app, based on URL
                        className = "content-container",
                        style = Dict("margin" => "70px")
                    ),
                    html_div(id = "backlinks-bottom", className = "backlinks")
                ),
                className = "rhs-content container-width"
            ),
            dugc_pagemenu(id = "pagemenu")
        )
    )
end;

callback!(app,
    Output("chapter", "children"),
    Output("pagemenu", "dummy2"),
    Input("url", "pathname")) do pathname
       get_content(pathname) = @match pathname begin
            "/introduction" => chapters_whats_dash.app.layout
            "/installation" => chapters_installation.app.layout
            "/getting-started" => chapters_getting_started.app.layout
            "/basic-callbacks" => chapters_callbacks.app.layout
            "/interactive-graphing" => chapters_interactive_graphing.app.layout
            "/sharing-data-between-callbacks" => chapters_sharing_data.app.layout
            "/deployment" => chapters_deployment.app.layout
            "/faqs" => chapters_faq_gotchas.app.layout
            "/dash_core_components" => chapters_dash_core_components.app.layout
            "/dash_core_components/dropdown" => chapters_dash_core_components_dropdown.app.layout
            "/dash_core_components/slider" => chapters_dash_core_components_slider.app.layout
            "/dash_core_components/rangeslider" => chapters_dash_core_components_rangeslider.app.layout
            "/dash_core_components/input" => chapters_dash_core_components_input.app.layout
            "/dash_core_components/textarea" => chapters_dash_core_components_textarea.app.layout
            "/dash_core_components/checklist" => chapters_dash_core_components_checklist.app.layout
            "/dash_core_components/radioitems" => chapters_dash_core_components_radioitems.app.layout
            "/dash_core_components/datepickersingle" => chapters_dash_core_components_datepickersingle.app.layout
            "/dash_core_components/datepickerrange" => chapters_dash_core_components_datepickerrange.app.layout
            "/dash_core_components/markdown" => chapters_dash_core_components_markdown.app.layout
            "/dash_core_components/tabs" => chapters_dash_core_components_tabs.app.layout
            "/dash_html_components" => chapters_dash_html_components.app.layout
            "/dash_daq" => chapters_dash_daq.app.layout
            "/dash_daq/boolean_switch" => chapters_dash_daq_colorpicker.app.layout
            "/dash_daq/color_picker" => chapters_dash_daq_colorpicker.app.layout
            "/dash_daq/dark_theme_provider" => chapters_dash_daq_darkthemeprovider.app.layout
            "/dash_daq/gauge" => chapters_dash_daq_gauge.app.layout
            _ => html_div() do
                html_br(),
                html_h1("Dash for Julia User Guide"),
                Section(
                    "What's Dash?",
                    (
                        Chapter(
                            "Introduction",
                            "/introduction",
                            "A quick paragraph about Dash and a link to the talk at Plotcon that started it all."
                        ),
                        Chapter(
                            "Announcement Essay",
                            "https://medium.com/plotly/announcing-dash-for-julia-f017c90c6ef1",
                            "Our extended essay on Dash. An extended discussion of Dash's architecture and our motivation behind the project."
                        ),
                        Chapter(
                            "Dash App Gallery",
                            "https://dash.plotly.com/gallery",
                            "A glimpse into what's possible with Dash."
                        ),
                        Chapter(
                            "Dash Club",
                            "https://plot.us12.list-manage.com/subscribe?u=28d7f8f0685d044fb51f0d4ee&id=0c1cb734d7",
                            "A fortnightly email newsletter by chriddyp, the creator of Dash."
                        )
                    )
                ),
                Section(
                "Dash Tutorial",
                (
                    Chapter(
                        "Part 1. Installation",
                        "/installation",
                        "How to install and upgrade Dash libraries with the Pkg package manager."
                    ),
                    Chapter(
                        "Part 2. The Dash Layout",
                        "/getting-started",
                        "The Dash `layout` describes what your app will look like and is composed of a set of declarative Dash components."
                    ),
                    Chapter(
                        "Part 3. Basic Callbacks",
                        "/basic-callbacks",
                        "Dash apps are made interactive through Dash Callbacks:
                        Julia functions that are automatically called whenever an input component's property changes. Callbacks can be chained,
                        allowing one update in the UI to trigger several updates across the app."
                    ),
                    Chapter(
                        "Part 4. Interactive Graphing and Crossfiltering",
                        "/interactive-graphing",
                        "Bind interactivity to the Dash `Graph` component whenever you hover, click, or
                        select points on your chart."
                    ),
                    Chapter(
                        "Part 5. Sharing Data Between Callbacks",
                        "/sharing-data-between-callbacks",
                        "`global` variables will break your Dash apps. However, there are other ways
                        to share data between callbacks. This chapter is useful for callbacks that
                        run expensive data processing tasks or process large data."
                    ),
                    Chapter(
                        "Part 6. FAQs and Gotchas",
                        "/faqs",
                        "If you have read through the rest of the tutorial and still have questions
                        or are encountering unexpected behaviour, this chapter may be useful."
                        )
                    )
                ),

                Section(
                    "Open Source Component Libraries",
                    (
                        Chapter(
                            "Dash Core Components",
                            "/dash_core_components",
                            "The Dash Core Component library contains a set of higher-level components like sliders, graphs, dropdowns, tables, and more."
                        ),
                        Chapter(
                            "Dash HTML Components",
                            "/dash_html_components",
                            "The Dash HTML Components library contains a set of components like button, div, form and more."
                        ),
                        Chapter(
                            "Dash DAQ",
                            "/dash_daq",
                            "The Dash DAQ library contains a set of higher-level components like boolean switch, color picker, gauge and more."
                        )
                    )
                ),
                Section(
                    "Production",
                    (
                        Chapter(
                            "Deployment",
                            "/deployment",
                            ""
                        )
                    )
                )
            end
        end
    return get_content(pathname), ""
end;

callback!(
    ClientsideFunction("clientside", "pagemenu"),
    app,
    Output("pagemenu", "dummy"),
    Input("chapter", "children")
)

port = parse(Int64, ENV["PORT"])

print("Binding to PORT $(port)...")

run_server(app, "0.0.0.0", port)
