<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				method: 'GET'
				,url: '/Project/getMemAge?pjo_code=<%=pjo_code%>'
				,success: function(jsonData) {
			      	// Load the Visualization API and the pie chart pakage.
			      	google.charts.load("current", {packages:["corechart"]});
			      	google.charts.setOnLoadCallback(drawChart);
			     	function drawChart() {
			        	var options = {
			    			title: '연령대 별 분포도'
		    	        	,pieHole: '0.3'
	    	            	,chartArea: {'width': '80%', 'height': '80%'}
			        		,backgroundColor: '#E7E7E7'
			        		,pieSliceText: 'label'
			        		
			    	    }
			            // Create our data table out of JSON data loaded from server.
			            var data = new google.visualization.DataTable(jsonData);
			            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			            chart.draw(data, options);
			            /**
			             * Selector for chart element.
			             */
			            var chartSelector = '#chart';

			            /**
			             * Selector used to get label elements inside the rendered chart.
			             * Your mileage may vary if you configure your chart different than
			             * me. Use Firebug or Developer Tools to step through the SVG and
			             * determine your label selector.
			             */
			            var labelSelector = '> g:eq(1) g text';
			            
			            // The <svg/> element rendered by Google Charts
			            var svg = $('svg', document.getElementById('chart_div'));
			            
			            /*
			             * Step through all the labels in the legend.
			             */
			            $(labelSelector, svg).each(function (i, v) {
			            
			    	        /*
			            	 * I'm retrieving the value of the second column in my data table,
			    	         * which contains the number that I want to display. If your logic
			    	         * is more complicated, change this line to calculate a new total.
			    	         */
			    	        var total = data.getValue(i, 1);
			    	          
			    	        // The new label text.
			    	        if(total!=0){
			    	        	var newLabel = $(this).text() + ' ' + total + '명';
			    	        }else{
			    	        	var newLabel = $(this).text() + ' ' + 1 + '명';
			    	        }
			    	      	
			    	        // Update the label text.
			    	        $(this).text(newLabel);
			            });
		    	  	}
			     }
			});
		});
	</script>
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
