require 'prawn'

Prawn::Document.generate("shapes1.pdf") do
  fill_color "ff0000"
# Fills a red circle
  circle_at [100, 100], :radius => 25
  fill
# Strokes a transparent circle with a black border and a line extending
# from its center point
  circle_at [300, 300], :radius => 50
  line [300, 300], [350, 300]
  stroke
# Fills and strokes a red hexagon with a black border
  polygon [100, 250], [200, 300], [300, 250],
          [300, 150], [200, 100], [100, 150]
  fill_and_stroke
end

Prawn::Document.generate("shapes2.pdf") do
  fill_color "ff0000"
# Fills a red circle
  fill { circle_at [100, 100], :radius => 25 }
# Strokes a transparent circle with a black border and a line extending
# from its center point
  stroke do
    circle_at [300, 300], :radius => 50
    line [300, 300], [350, 300]
  end
  fill_and_stroke do
# Fills and strokes a red hexagon with a black border
    polygon [100, 250], [200, 300], [300, 250],
            [300, 150], [200, 100], [100, 150]
  end
end

Prawn::Document.generate("shapes3.pdf") do
  fill_color "ff0000"
  fill_circle_at [100, 100], :radius => 25
  stroke_circle_at [300, 300], :radius => 50
  stroke_line [300, 300], [350, 300]
  fill_and_stroke_polygon [100, 250], [200, 300], [300, 250],
                          [300, 150], [200, 100], [100, 150]
end