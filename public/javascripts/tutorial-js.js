function update( chart_data )
{
	
	// choose a random bar (one of the 5 bars):
	var item = Math.floor(Math.random()*5);
	
	// set the left value: min 0 max 4
	var left = Math.floor(Math.random()*4); 
	
	// set the right value: min 5 max 8:
	var right = Math.floor(Math.random()*3) + 5;
	
	//
	// change the data object:
	//
	var hbar = {right:right, left:left};
	chart_data['elements'][0]['values'][item] = hbar;
	
	//
	// pass the new chart_data as a JSON string to the chart:
	//
	tmp = findSWF("my_chart");
    x = tmp.load( JSON.stringify(chart_data) );
}

function save( chart_data )
{

	var post = '';
	
	for( var pos in chart_data['elements'][0]['values'] )
	{
		var hbar = chart_data['elements'][0]['values'][pos];
		post += '[';
		if( hbar.left )
			post += hbar.left +',';
		post += hbar.right +']\n';;	
	}
	alert(post);
	
	//
	// or use JSON:
	//
	
	alert( JSON.stringify(chart_data['elements'][0]['values']) );
}