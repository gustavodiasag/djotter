use magnus::{function, Error, Ruby};

fn djot_to_html(src: String) -> String {
    use jotdown::*;

    let events = Parser::new(&src);
    html::render_to_string(events)
}

#[magnus::init]
fn init(ruby: &Ruby) -> Result<(), Error> {
    let djotter = ruby.define_module("Djotter")?;
    djotter.define_module_function("djot_to_html", function!(djot_to_html, 1))?;
    Ok(())
}
