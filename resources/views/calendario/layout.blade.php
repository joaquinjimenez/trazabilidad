<!DOCTYPE html>
<html>
<head>
	<title>Calendario</title>
	<style src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.0/fullcalendar.min.css"></style>
	<style src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.0/fullcalendar.print.css"></style>
	
</head>


<body>



{!! $calendar->cañendar() !!}
{!! $calendar->script() !!}


<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	


	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.0/fullcalendar.min.js"></script>



	<!-- <script>
	$(document).ready(function() {

	    $('#calendar').fullCalendar({
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,basicWeek,basicDay'
	      },
	      defaultDate: '2017-12-12',
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: [
	        {
	          title: 'All Day Event',
	          start: '2017-12-01'
	        },
	        {
	          title: 'Long Event',
	          start: '2017-12-07',
	          end: '2017-12-10'
	        },
	        {
	          id: 999,
	          title: 'Repeating Event',
	          start: '2017-12-09T16:00:00'
	        },
	        {
	          id: 999,
	          title: 'Repeating Event',
	          start: '2017-12-16T16:00:00'
	        },
	        {
	          title: 'Conference',
	          start: '2017-12-11',
	          end: '2017-12-13'
	        },
	        {
	          title: 'Meeting',
	          start: '2017-12-12T10:30:00',
	          end: '2017-12-12T12:30:00'
	        },
	        {
	          title: 'Lunch',
	          start: '2017-12-12T12:00:00'
	        },
	        {
	          title: 'Meeting',
	          start: '2017-12-12T14:30:00'
	        },
	        {
	          title: 'Happy Hour',
	          start: '2017-12-12T17:30:00'
	        },
	        {
	          title: 'Dinner',
	          start: '2017-12-12T20:00:00'
	        },
	        {
	          title: 'Birthday Party',
	          start: '2017-12-13T07:00:00'
	        },
	        {
	          title: 'Click for Google',
	          url: 'http://google.com/',
	          start: '2017-12-28'
	        }
	      ]
	    });

	  });

	</script> -->

</body>
</html>





