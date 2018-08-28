
var barHeight = Math.ceil(height / data.length);

svg.selectAll('line')
  .data(data)
  .enter().append('line')
    .attr('width', function(d) { return d * width; })
    .attr('height', barHeight)
    .attr('y', function(d, i) { return i * barHeight; })
    .attr('fill', '#edf8b1');
