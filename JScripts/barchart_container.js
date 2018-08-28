
var bars = div
  .selectAll("div")
  .data(data);
    
bars.enter().append("div")
  .style("width", function(d) { return 4 + d * 10 + "px"; })
  .style("background-color", "orange")
  .style("border", "1px solid white")
  .style("color", "white")
  .style("padding-left", "2px")
  .text(function(d) { return d; });
  
  
  