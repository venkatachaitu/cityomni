<!-- The Modal -->
 <div id="myModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
	   <div class="modal-header">
	      <span class="close" id="close">&times;</span>
	      <h2 style="font-size: 1.5em;">Select City</h2>
	   </div>
	   <div class="modal-body">
	   		<table>
	   			<tr>
	   				<td><p onclick="setLocation('delhi')">1. Delhi&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
	   				<td><p onclick="setLocation('mumbai')">2. Mumbai&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
   				</tr>
   				<tr>
	   				<td><p onclick="setLocation('kolkata')">3. Kolkata&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
	   				<td><p onclick="setLocation('chennai')">4. Chennai&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
   				</tr>
   				<tr>
	   				<td><p onclick="setLocation('bangalore')">5. Bangalore&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
	   				<td><p onclick="setLocation('hyderabad')">6. Hyderabad&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
   				</tr>
   				<tr>
	   				<td><p onclick="setLocation('ahmedabad')">7. Ahmedabad&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
	   				<td><p onclick="setLocation('pune')">8. Pune&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
   				</tr>
   				<tr>
	   				<td><p onclick="setLocation('surat')">9. Surat&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
	   				<td><p onclick="setLocation('jaipur')">10. Jaipur&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p></td>
   				</tr>
	   		</table>
	   
			<!-- <p onclick="setLocation('bangalore')">Bangalore&nbsp;<span><i class="fa fa-times" aria-hidden="true"></i></span></p> -->
			<!-- <p onclick="setLocation('chennai')">Chennai&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p> -->
			<!-- <p onclick="setLocation('hyderabad')">Hyderabad&nbsp;<span><i class="fa fa-times" aria-hidden="true"></i></span></p> -->
			<!-- <p onclick="setLocation('vijayawada')">Vijayawada&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p> -->
			<!-- <p onclick="setLocation('visakhapatnam')">Visakhapatnam&nbsp;<span><i class="fa fa-times" aria-hidden="true"></i></span></p> -->
			<!-- <p onclick="setLocation('tirupati')">Tirupati&nbsp;<span><i class="fa fa-check" aria-hidden="true"></i></span></p> -->
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