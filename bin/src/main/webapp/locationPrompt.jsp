<!-- The Modal -->
 <div id="myModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
	   <div class="modal-header">
	      <span class="close" id="close">&times;</span>
	      <h2 style="font-size: 1.5em;">Select City</h2>
	   </div>
	   <div class="modal-body">
			<p onclick="setLocation('delhi')">Delhi&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p>
			<!-- <p onclick="setLocation('bangalore')">Bangalore&nbsp;<span><i class="fa fa-times" aria-hidden="true"></i></span></p> -->
			<p onclick="setLocation('chennai')">Chennai&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p>
			<!-- <p onclick="setLocation('hyderabad')">Hyderabad&nbsp;<span><i class="fa fa-times" aria-hidden="true"></i></span></p> -->
			<p onclick="setLocation('vijayawada')">Vijayawada&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p>
			<!-- <p onclick="setLocation('visakhapatnam')">Visakhapatnam&nbsp;<span><i class="fa fa-times" aria-hidden="true"></i></span></p> -->
			<p onclick="setLocation('tirupati')">Tirupati&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p>
	   </div>
	</div>
</div>
<style>
	.fa-check{
		color: #14ca14;
	    opacity: .3;
	}
	.fa-times{
		color: red;
		opacity: .3;
	}
</style>