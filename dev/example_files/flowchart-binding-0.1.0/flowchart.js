HTMLWidgets.widget({

  name: 'flowchart',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        // el.innerText = x.message;
        var diagram = flowchart.parse(x.chart_specs);
        diagram.drawSVG(el);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
