class TestItController < ApplicationController
  #  include OpenFlashChart
  
  def index
    respond_to do |wants|
      wants.html {
        @graph = open_flash_chart_object( 600, 300, url_for( :action => 'index', :format => :json ) )
      }
      wants.json { 
        chart = OpenFlashChart.new do |c|
          c << BarGlass.new( :values => (1..10).sort_by{rand} )
          title = Title.new("MY TITLE")
          c.set_title(title)          
        end
        render :text => chart, :layout => false
      }
    end
  end
  
  def index_bar
    @graph = open_flash_chart_object(600,300,"/test_it/graph_code_bar")
  end
  
  def graph_code_bar
    title = Title.new("MY TITLE")
    bar = BarGlass.new
    bar.set_values([1,2,3,4,5,6,7,8,9])
    chart = OpenFlashChart.new
    chart.set_title(title)
    chart.add_element(bar)
    #    chart.set_colours('#000000','#FF00FF')
    chart.set_bg_colour("#FFFFFF")
    render :text => chart.to_s
  end
  
  def index_line
    @graph = open_flash_chart_object(600,300,"/test_it/graph_code_line")
  end
  
  def graph_code_line
    # based on this example - http://teethgrinder.co.uk/open-flash-chart-2/data-lines-2.php
    title = Title.new("Multiple Lines")
    
    data1 = []
    data2 = []
    data3 = []
    
    10.times do |x|
      data1 << rand(5) + 1
      data2 << rand(6) + 7
      data3 << rand(5) + 14
    end
    
    line_dot = LineDot.new
    line_dot.width = 4
    line_dot.colour = '#DFC329'
    line_dot.dot_size = 5
    line_dot.values = data1
    #    line_dot.set_key('Page Views', 10)
    
    line_hollow = LineHollow.new
    line_hollow.width = 1
    line_hollow.colour = '#6363AC'
    line_hollow.dot_size = 5
    line_hollow.values = data2
    
    line = Line.new
    line.width = 1
    line.colour = '#5E4725'
    line.dot_size = 5
    line.values = data3
    
    line.text = 'line'
    line_dot.text = 'line_dot'
    line_hollow.text = 'line_hollow'
    
    y = YAxis.new
    y.set_range(0,20,5)
    
    x_legend = XLegend.new("MY X Legend")
    x_legend.set_style('{font-size: 20px; color: #778877}')
    
    y_legend = YLegend.new("MY Y Legend")
    y_legend.set_style('{font-size: 20px; color: #770077}')
    
    chart =OpenFlashChart.new
    chart.set_title(title)
    chart.set_x_legend(x_legend)
    chart.set_y_legend(y_legend)
    chart.y_axis = y
    x = XAxis.new
    x.set_labels([ "Jan", "", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"])
    #    x.set_range(0,6,2)
    chart.x_axis = x
    chart.add_element(line_dot)
    chart.add_element(line_hollow)
    chart.add_element(line)
    
    render :text => chart.to_s
  end
  
  def index_js_1
    title = Title.new("MY TITLE")
    bar = BarGlass.new
    bar.set_values([1,2,3,4,5,6,7,8,9])
    @chart = OpenFlashChart.new
    @chart.set_title(title)
    @chart.add_element(bar)
  end
  
  def index_js_2
    title = Title.new("MY TITLE")
    bar = BarGlass.new
    bar.set_values([1,2,3,4,5,6,7,8,9])
    chart1 = OpenFlashChart.new
    chart1.set_title(title)
    chart1.add_element(bar)
    
    title = Title.new("MY TITLE 2")
    bar = BarGlass.new
    bar.set_values([1,2,3,4,5,6,7,8,9].reverse)
    chart2 = OpenFlashChart.new
    chart2.set_title(title)
    chart2.add_element(bar)
    
    title = Title.new("MY TITLE - some new data")
    bar = BarGlass.new
    bar.set_values([1,3,2,5,4,7,6,9,8])
    chart3 = OpenFlashChart.new
    chart3.set_title(title)
    chart3.add_element(bar)
    
    @charts = [chart1, chart2, chart3]
  end
  
  def index_js_3
    title = Title.new("MY TITLE - original")
    bar = BarGlass.new
    bar.set_values([1,2,3,4,5,6,7,8,9])
    @chart = OpenFlashChart.new
    @chart.set_title(title)
    @chart.add_element(bar)
  end
  
  def some_server_data
    title = Title.new("MY TITLE - some new data from server")
    bar = BarGlass.new
    bar.set_values([1,3,2,5,4,7,6,9,8])
    chart = OpenFlashChart.new
    chart.set_title(title)
    chart.add_element(bar)
    render :text => chart.render
  end
  
  def index_js_3_line
    title = Title.new("Multiple Lines")
    
    data1 = [5, 3, 4, 1, 3, 2, 5, 4, 3, 3]
    data2 = [12, 9, 9, 7, 8, 8, 9, 9, 8, 9]
    data3 = [16, 14, 17, 18, 14, 15, 16, 18, 15, 15]
    
    line_dot = LineDot.new
    line_dot.text = "Line Dot"
    line_dot.width = 4
    line_dot.colour = '#DFC329'
    line_dot.dot_size = 5
    line_dot.values = data1
    
    line_hollow = LineHollow.new
    line_hollow.text = "Line Hollow"
    line_hollow.width = 1
    line_hollow.colour = '#6363AC'
    line_hollow.dot_size = 5
    line_hollow.values = data2
    
    line = Line.new
    line.text = "Line"
    line.width = 1
    line.colour = '#5E4725'
    line.dot_size = 5
    line.values = data3
    
    y = YAxis.new
    y.set_range(0,20,5)
    
    x_legend = XLegend.new("MY X Legend")
    x_legend.set_style('{font-size: 20px; color: #778877}')
    
    y_legend = YLegend.new("MY Y Legend")
    y_legend.set_style('{font-size: 20px; color: #770077}')
    
    chart =OpenFlashChart.new
    chart.set_title(title)
    chart.set_x_legend(x_legend)
    chart.set_y_legend(y_legend)
    chart.y_axis = y
    
    chart.add_element(line_dot)
    chart.add_element(line_hollow)
    @chart = chart
    #    chart.add_element(line)
  end
  
  
  def some_server_data_line
    title = Title.new("Multiple Lines")
    
    data1 = [5, 3, 4, 1, 3, 2, 5, 4, 3, 3]
    data2 = [12, 9, 9, 7, 8, 8, 9, 9, 8, 9]
    data3 = [16, 14, 17, 18, 14, 15, 16, 18, 15, 15]
    
    line_dot = LineDot.new
    line_dot.text = "Line Dot"
    line_dot.width = 4
    line_dot.colour = '#DFC329'
    line_dot.dot_size = 5
    line_dot.values = data1
    
    line_hollow = LineHollow.new
    line_hollow.text = "Line Hollow"
    line_hollow.width = 1
    line_hollow.colour = '#6363AC'
    line_hollow.dot_size = 5
    line_hollow.values = data2
    
    line = Line.new
    line.text = "Line"
    line.width = 1
    line.colour = '#5E4725'
    line.dot_size = 5
    line.values = data3
    
    y = YAxis.new
    y.set_range(0,20,5)
    
    x_legend = XLegend.new("MY X Legend")
    x_legend.set_style('{font-size: 20px; color: #778877}')
    
    y_legend = YLegend.new("MY Y Legend")
    y_legend.set_style('{font-size: 20px; color: #770077}')
    
    chart =OpenFlashChart.new
    chart.set_title(title)
    chart.set_x_legend(x_legend)
    chart.set_y_legend(y_legend)
    chart.y_axis = y
    
    chart.add_element(line_dot)
    chart.add_element(line_hollow)
    chart.add_element(line)
    
    render :text => chart.to_s
  end
  
  def index_js_4
  end
  
  def index_scatterline
    @graph = open_flash_chart_object(600,300,"/test_it/graph_code_scatterline")
  end
  
  def graph_code_scatterline
    chart = OpenFlashChart.new
    title = Title.new(Date.today.to_s)
    chart.set_title(title)
    
    scatter_line = ScatterLine.new( '#FFD600', 3 )
    v = Array.new
    x = 0
    y = 0
    while x < 25 
      v.push(ScatterValue.new(x,y))
      #    // move up or down in Y axis:
      y += (-1+2*rand)*2
      if y>10
        y=10
      end
      if y<-10
        y=-10
      end
      x += (5+10*rand)/10
    end
    scatter_line.set_values(v)
    chart.add_element(scatter_line)
    
    x_axis = XAxis.new
    x_axis.set_range(0,25)
    chart.x_axis = x_axis
    
    y_axis = YAxis.new
    y_axis.set_range( -10, 10 )
    chart.y_axis = y_axis
    render :text => chart.to_s
  end
  
  def index_pie
    @graph = open_flash_chart_object(600,300,"/test_it/graph_code_pie")
  end
  
  def graph_code_pie
    # based on this example - http://teethgrinder.co.uk/open-flash-chart-2/pie-chart.php
    title = Title.new("Pie Chart Example For Chipster")
    
    pie = Pie.new
    pie.start_angle = 35
    pie.animate = true
    pie.tooltip = '#val# of #total#<br>#percent# of 100%'
    pie.colours = ["#d01f3c", "#356aa0", "#C79810"]
    pie.values  = [2,3, PieValue.new(6.5,"Hello (6.5)")]
    
    chart = OpenFlashChart.new
    chart.title = title
    chart.add_element(pie)
    
    chart.x_axis = nil
    
    render :text => chart.to_s
  end
  
  def index_radar
    @graph = open_flash_chart_object(600,300,"/test_it/graph_code_radar")
  end
  
  def graph_code_radar
    # based on this example - http://teethgrinder.co.uk/open-flash-chart-2/radar-chart-lines.php
    chart = OpenFlashChart.new
    chart.set_title(Title.new('Radar Chart'))
    line_1 = LineHollow.new
    line_1.set_values(Array.new([3, 4, 5, 4, 3, 3, 2.5]))
    line_1.set_halo_size( 2 )
    line_1.set_width( 1 )
    line_1.set_dot_size( 3 )
    line_1.set_colour( '#FBB829' )
    line_1.set_tooltip( "Gold<br>#val#" )
    line_1.set_key( 'Mr Gold', 10 )
    
    line_2 = LineDot.new
    line_2.set_values(Array.new([2, 2, 2, 2, 2, 2, 2]));
    line_2.set_halo_size( 2 )
    line_2.set_width( 1 )
    line_2.set_dot_size( 3 )
    line_2.set_colour( '#8000FF' )
    line_2.set_tooltip( "Purple<br>#val#" )
    line_2.set_key( 'Mr Purple', 10 )
    line_2.loop()
    
    #// add the area object to the chart:
    chart.add_element( line_1 )
    chart.add_element( line_2 )
    #    
    r = RadarAxis.new( 5 )
    
    r.set_colour( '#DAD5E0' )
    r.set_grid_colour( '#DAD5E0' )
    labels = RadarAxisLabels.new(Array.new(['Zero','','','Middle','','High']))
    labels.set_colour( '#9F819F' )
    r.set_labels( labels )
    
    spoke_labels = RadarSpokeLabels.new(Array.new([
        'Strength',
        'Smarts',
        'Sweet<br>Tooth',
        'Armour',
        'Max Hit Points',
        '???',
        'Looks Like a Monkey']))
    
    spoke_labels.set_colour( '#9F819F' )
    r.set_spoke_labels( spoke_labels )
    chart.set_radar_axis( r )
    tooltip = Tooltip.new()
    tooltip.set_proximity()
    chart.set_tooltip( tooltip )
    chart.set_bg_colour( '#ffffff' )
    render :text => chart.to_s
  end  
  
  def index_radar_lines
    # from http://ingiroingiro.blogspot.com/2008/12/radar-chart-lines.html 
    @graph = open_flash_chart_object(600,300,"/test_it/graph_code_radar_lines")
  end
  
  def graph_code_radar_lines
    # based on this example - http://teethgrinder.co.uk/open-flash-chart-2/radar-chart-lines.php
    chart = OpenFlashChart.new
    chart.set_title(Title.new('Radar Chart'))
    
    values = [30,50,60,70,80,90,100,115,130,115,100,90,80,70,60,50]
    spokes = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p']
    vals = []
    
    values.each_with_index do |value, i|
      tmp = DotValue.new( value, '#D41E47' )
      tmp.set_tooltip("#val#&ltbr%rtSpoke: #{spokes[i]}")
      vals.push(tmp)
    end
    
    line = LineHollow.new()
    line.set_values( vals )
    line.set_halo_size( 0 )
    line.set_width( 2 )
    line.set_dot_size( 6 )
    line.set_colour( '#FBB829' )
    line.set_key( 'Hearts', 10 )
    line.loop()
    
    
    # add the area object to the chart:
    chart.add_element(line)
    
    r = RadarAxis.new( 150 )
    r.set_steps(10)
    r.set_colour( '#DAD5E0' )
    r.set_grid_colour( '#EFEFEF' )
    chart.set_radar_axis( r )
    
    tooltip = Tooltip.new()
    tooltip.set_proximity()
    chart.set_tooltip( tooltip )
    
    chart.set_bg_colour( '#ffffff' )
    
    render :text => chart.to_s
  end
  
  def index_line_band
    # from http://ingiroingiro.blogspot.com/2008/12/grafico-con-banda-derrore.html 
    @graph = open_flash_chart_object(600,300,"/test_it/graph_code_line_band")
  end
  
  def graph_code_line_band    
    title = Title.new("a Graph")
    
    chart = OpenFlashChart.new
    chart.set_title(title)
    
    @data_up = [1]
    @data_down = [-1]
    
    0.step(30, 1) {|i|
      @data_up << @data_up[i] +rand - 0.5
      @data_down << @data_down[i] + rand - 0.5
    }
    
    def draw_quadri(i)
      q = Shape.new( '#80B11A' )                        
      q.append_value(ShapePoint.new(i,@data_up[i]))
      q.append_value(ShapePoint.new(i,@data_down[i]))
      q.append_value(ShapePoint.new(i+1,@data_down[i+1]))
      q.append_value(ShapePoint.new(i+1,@data_up[i+1])) 
      return q
    end
    
    flux = []
     (@data_up.length-1).times do |h|
      flux << draw_quadri(h)
    end
    
    flux.each do  |shape|
      chart.add_element(shape)
    end
    
    scatter_line = ScatterLine.new( '#FF0000', 5 )
    scatter_line_u = ScatterLine.new( '#FF0000', 3 )
    scatter_line_d = ScatterLine.new( '#FF0000', 3 )
    data = []
    data_u = []
    data_d = []
    
    x=0
     (@data_up.length).times do |h|
      data   << (ScatterValue.new(x,(@data_up[h] + @data_down[h])/ 2))
      data_u << (ScatterValue.new(x,@data_up[h]))
      data_d << (ScatterValue.new(x,@data_down[h]))
      x+=1
    end
    
    scatter_line.set_values(data);         chart.add_element(scatter_line)
    scatter_line_u.set_values(data_u);     chart.add_element(scatter_line_u)
    scatter_line_d.set_values(data_d);     chart.add_element(scatter_line_d)
    
    x = XAxis.new
    x.set_range(0,32,5)
    x.set_offset(false)
    chart.set_x_axis(x)
    
    y = YAxis.new
    y.set_range(-5,5,1)
    y.set_offset(true)
    chart.set_y_axis(y)
    
    render :text => chart.to_s
  end    
  
  def all_graphs
    @graph_bar  = open_flash_chart_object(600,300,"/test_it/graph_code_bar")
    @graph_line = open_flash_chart_object(600,300,"/test_it/graph_code_line")
    @graph_pie  = open_flash_chart_object(600,300,"/test_it/graph_code_pie")
    @graph_sl   = open_flash_chart_object(600,300,"/test_it/graph_code_scatterline")
    @graph_radar= open_flash_chart_object(600,300,"/test_it/graph_code_radar")
    @graph_radar_lines = open_flash_chart_object(600,300,"/test_it/graph_code_radar_lines")
    @graph_line_band  = open_flash_chart_object(600,300,"/test_it/graph_code_line_band")
  end
end
