class TestIchorController < ApplicationController
    ######## EXAMPLES FOR OFC ICHOR MARCH 2009
  def line
    @graph = open_flash_chart_object(600,300,"/test_ichor/graph_line")
  end
  
  def graph_line
    # For OFC ICHOR march 2009
    #$title = new title( date("D M d Y") );
    title = OFC::Title.new(:text => Time.now.strftime("%a %b %d %Y"))
#    title = Title.new(:text => Time.now.strftime("%a %b %d %Y"))

    #$line_dot = new line();
    #$line_dot->set_values( array(1,2,1,null,null,null,null,null) );
    line_dot = OFC::Line.new(:values => [1,2,1,nil,nil,nil,nil,nil])
#    line_dot = Line.new(:values => [1,2,1,nil,nil,nil,nil,nil])

    #$chart = new open_flash_chart();
    #$chart->set_title( $title );
    #$chart->add_element( $line_dot );
    chart = OFC::OpenFlashChart.new(:title => title, :elements => [line_dot])
#    chart = OpenFlashChart.new(:title => title, :elements => [line_dot])

    #echo $chart->toPrettyString();
    render :text => chart.render
  end
  
  def line_dot
    @graph = open_flash_chart_object(600,300,"/test_ichor/graph_line_dot")
  end
  
  def graph_line_dot
    # For OFC ICHOR march 2009
    #$data_1 = array();
    #$data_2 = array();
    #$data_3 = array();
    data_1 = []
    data_2 = []
    data_3 = []

    #for( $i=0; $i<6.2; $i+=0.2 )
    #{
    #  $data_1[] = (sin($i) * 1.9) + 10;
    #  $data_2[] = (sin($i) * 1.9) + 7;
    #  $data_3[] = (sin($i) * 1.9) + 4;
    #}
    (0..31).each do |x|
      data_1 << (Math.sin(x * 0.2) * 1.9) + 10
      data_2 << (Math.sin(x * 0.2) * 1.9) + 7
      data_3 << (Math.sin(x * 0.2) * 1.9) + 4
    end

    #$title = new title( date("D M d Y") );
    title = OFC::Title.new(:text => Time.now.strftime("%a %b %d %Y"))

    #$line_1_default_dot = new dot();
    #$line_1_default_dot->colour('#f00000');
    line_1_default_dot = OFC::Dot.new(:colour => '#f00000')

    #$line_1 = new line();
    #$line_1->set_default_dot_style($line_1_default_dot);
    #$line_1->set_values( $data_1 );
    #$line_1->set_width( 1 );
    line_1 = OFC::Line.new(:dot_style => line_1_default_dot, :values => data_1, :width => 1)

    #// ------- LINE 2 -----
    #$line_2_default_dot = new dot();
    #$line_2_default_dot->size(3)->halo_size(1)->colour('#3D5C56');
    line_2_default_dot = Dot.new(:dot_size => 3, :halo_size => 1, :colour => '#3D5C56')

    #$line_2 = new line();
    #$line_2->set_default_dot_style($line_2_default_dot);
    #$line_2->set_values( $data_2 );
    #$line_2->set_width( 2 );
    #$line_2->set_colour( '#3D5C56' );
    line_2 = OFC::Line.new(:dot_style => line_2_default_dot, :values => data_2, :width => 2, :colour => '#3D5C56')

    #// ------- LINE 2 -----
    #$line_3_default_dot = new dot();
    #$line_3_default_dot->size(4)->halo_size(2);
    line_3_default_dot = Dot.new(:dot_size => 5, :halo_size => 2)

    #$line_3 = new line();
    #$line_3->set_default_dot_style($line_3_default_dot);
    #$line_3->set_values( $data_3 );
    #$line_3->set_width( 6 );
    line_3 = OFC::Line.new(:dot_style => line_3_default_dot, :values => data_3, :width => 6)

    #$y = new y_axis();
    #$y->set_range( 0, 15, 5 );
    y = OFC::YAxis.new(:min => 0, :max => 15, :steps => 5)


    #$chart = new open_flash_chart();
    #$chart->set_title( $title );
    chart = OFC::OpenFlashChart.new(:title => title)
    #$chart->add_element( $line_1 );
    #$chart->add_element( $line_2 );
    #$chart->add_element( $line_3 );
    chart.elements = [line_1,line_2,line_3]
    #$chart->set_y_axis( $y );
    chart.y_axis = y

    #echo $chart->toPrettyString();
    render :text => chart.render
  end

  def line_solid_dot
    @graph = open_flash_chart_object(600,300,"/test_ichor/graph_line_solid_dot")
  end
  
  def graph_line_solid_dot
    # For OFC ICHOR march 2009
    #$data = array();
    data = []

    #for( $i=0; $i<6.2; $i+=0.2 )
    #{
    #  $data[] = (sin($i) * 1.9) + 4;
    #}
    (0..31).each do |x|
      data << (Math.sin(x * 0.2) * 1.9) + 4
    end

    #$title = new title( date("D M d Y") );
    title = OFC::Title.new(:text => Time.now.strftime("%a %b %d %Y"))

    #// ------- LINE 2 -----
    #$d = new solid_dot();
    #$d->size(3)->halo_size(1)->colour('#3D5C56');
    d = OFC::SolidDot.new(:dot_size => 3, :halo_size => 1, :colour => '#3D5C56')

    #$line = new line();
    #$line->set_default_dot_style($d);
    #$line->set_values( $data );
    #$line->set_width( 2 );
    #$line->set_colour( '#3D5C56' );
    line = OFC::Line.new(:dot_style => d, :values => data, :width => 2, :colour => '#3D5C56')


    #$y = new y_axis();
    #$y->set_range( 0, 8, 4 );
    y = OFC::YAxis.new(:min => 0, :max => 8, :steps => 4)


    #$chart = new open_flash_chart();
    #$chart->set_title( $title );
    #$chart->add_element( $line );
    #$chart->set_y_axis( $y );
    chart = OFC::OpenFlashChart.new(:title => title, :elements => [line], :y_axis => y)

    #echo $chart->toPrettyString();
    render :text => chart.render
  end  

  def stacked_bar_chart
    @graph = open_flash_chart_object(600,300,"/test_ichor/graph_stacked_bar_chart")
  end
  
  def graph_stacked_bar_chart
    # For OFC ICHOR march 2009
    #$title = new title( 'Stuff I\'m thinking about, '.date("D M d Y") );
    #$title->set_style( "{font-size: 20px; color: #F24062; text-align: center;}" );
    title = OFC::Title.new(:text => "Stuff I'm thinking about", :style => "{font-size: 20px; color: #F24062; text-align: center;}")

    #$bar_stack = new bar_stack();
    #// set a cycle of 3 colours:
    #$bar_stack->set_colours( array( '#C4D318', '#50284A', '#7D7B6A' ) );
    bar_stack = OFC::BarStack.new(:colours => ['#C4D318', '#50284A', '#7D7B6A'])

    #// add 3 bars:
    #$bar_stack->append_stack( array( 2.5, 5, 2.5 ) );
    bar_stack.values = []
    bar_stack.values << [2.5,5,2.5]

    #// add 4 bars, the fourth will be the same colour as the first:
    #$bar_stack->append_stack( array( 2.5, 5, 1.25, 1.25 ) );
    bar_stack.values << [2.5,5,1.25,1.25]


    #$bar_stack->append_stack( array( 5, new bar_stack_value(5, '#ff0000') ) );
    # TODO figure out BarStackValue
    bar_stack.values << [5, { "val" => 5, "colour" => "#ff0000" }]
    #$bar_stack->append_stack( array( 2, 2, 2, 2, new bar_stack_value(2, '#ff00ff') ) );
    bar_stack.values << [2,2,2,2, { "val" => 2, "colour" => "#ff00ff" }]

    #$bar_stack->set_keys(
    #    array(
    #        new bar_stack_key( '#C4D318', 'Kiting', 13 ),
    #        new bar_stack_key( '#50284A', 'Work', 13 ),
    #        new bar_stack_key( '#7D7B6A', 'Drinking', 13 ),
    #        new bar_stack_key( '#ff0000', 'XXX', 13 ),
    #        new bar_stack_key( '#ff00ff', 'What rhymes with purple? Nurple?', 13 ),
    #        )
    #    );
    bar_stack.keys = [{ "colour" => "#C4D318", "text" => "Kiting", "font-size" => 13 },
                      { "colour" => "#50284A", "text" => "Work", "font-size" => 13 },
                      { "colour" => "#7D7B6A", "text" => "Drinking", "font-size" => 13 },
                      { "colour" => "#ff0000", "text" => "XXX", "font-size" => 13 },
                      { "colour" => "#ff00ff", "text" => "What rhymes with purple? Nurple?", "font-size" => 13 }]

    #$bar_stack->set_tooltip( 'X label [#x_label#], Value [#val#]<br>Total [#total#]' );
    bar_stack.tip = "X label [#x_label#], Value [#val#]<br>Total [#total#]"

    #$y = new y_axis();
    #$y->set_range( 0, 14, 2 );
    y = OFC::YAxis.new(:min => 0, :max => 14, :steps => 2)

    #$x = new x_axis();
    #$x->set_labels_from_array( array( 'Winter', 'Spring', 'Summer', 'Autmn' ) );
    x = OFC::XAxis.new(:labels => {:lables => ["Winter", "Spring", "Summer", "Autumn"]})

    #$tooltip = new tooltip();
    #$tooltip->set_hover();
    tooltip = OFC::Tooltip.new
    tooltip.mouse = 2

    #$chart = new open_flash_chart();
    #$chart->set_title( $title );
    chart = OFC::OpenFlashChart.new(:title => title)
    #$chart->add_element( $bar_stack );
    chart.elements = []
    chart.elements << bar_stack
    #$chart->set_x_axis( $x );
    chart.x_axis = x
    #$chart->add_y_axis( $y );
    chart.y_axis = y
    #$chart->set_tooltip( $tooltip );
    chart.tooltip = tooltip

    #echo $chart->toPrettyString(
    render :text => chart.render
  end

  def area_hollow
    @graph = open_flash_chart_object(600,300,"/test_ichor/graph_area_hollow")
  end
  
  def graph_area_hollow
    #$data = array();
    data = []

    #for( $i=0; $i<6.2; $i+=0.2 )
    #{
    #  $tmp = sin($i) * 1.9;
    #  $data[] = $tmp;
    #}

    (0..31).each do |x|
      data << Math.sin(x * 0.2) * 1.9
    end

    #include '../php-ofc-library/open-flash-chart.php';

    #$chart = new open_flash_chart();
    #$chart->set_title( new title( 'Area Chart' ) );

    chart = OFC::OpenFlashChart.new
    chart.title = OFC::Title.new(:text => "Area Chart")

    #//
    #// Make our area chart:
    #//
    #$area = new area();
    area = OFC::Area.new

    #// set the circle line width:
    #$area->set_width( 2 );
    area.width = 2

    #$area->set_default_dot_style( new hollow_dot() );
    area.dot_style = OFC::HollowDot.new

    #$area->set_colour( '#838A96' );
    area.colour = '#838A96'

    #$area->set_fill_colour( '#E01B49' );
    area.fill = '#E01B49'

    #$area->set_fill_alpha( 0.4 );
    area.fill_alpha = 0.4

    #$area->set_values( $data );
    area.values = data

    #// add the area object to the chart:
    #$chart->add_element( $area );
    chart.elements = []
    chart.elements << area

    #$y_axis = new y_axis();
    y_axis = OFC::YAxis.new

    #$y_axis->set_range( -2, 2, 2 );
    y_axis.min = -2
    y_axis.max = 2
    y_axis.steps = 2

    #$y_axis->labels = null;
    y_axis.lables = nil

    #$y_axis->set_offset( false );
    y_axis.offset = 0

    #$x_axis = new x_axis();
    x_axis = OFC::XAxis.new

    #$x_axis->labels = $data;
    x_axis.labels = data

    #$x_axis->set_steps( 2 );
    x_axis.steps = 2

    #$x_labels = new x_axis_labels();
    x_labels = OFC::XAxisLabels.new
    #$x_labels->set_steps( 4 );
    x_labels.steps = 4
    #$x_labels->set_vertical();
    x_labels.rotate = 270

    #// Add the X Axis Labels to the X Axis
    #$x_axis->set_labels( $x_labels );
    x_axis.labels = x_labels

    #$chart->add_y_axis( $y_axis );
    chart.y_axis = y_axis
    #$chart->x_axis = $x_axis;
    chart.x_axis = x_axis

    #echo $chart->toPrettyString();
    render :text => chart.render
  end  
end
