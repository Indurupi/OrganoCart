
<div class="modal hide fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" align="center">
				<button class="close" data-dismiss="modal">&times;</button>
				<p class="h2">Login Page</p>
			</div>
			<!--end modal 1 -->
			<div style="margin: 50px" align="center">
				<form action="perform_login" method="post">
					<div class="input-group" id="LoginUsername">
						<span class="input-group-addon" id="basic-addon1">
							<div class="glyphicon glyphicon-user"></div>
						</span> <input type="text" class="form-control"
							placeholder="Email" name="uname" id="uname" aria-describedby="basic-addon1"/>
					</div>
					<div class="input-group" id="LoginPassword">
						<span class="input-group-addon" id="basic-addon1">
							<div class="glyphicon glyphicon-lock"></div>
						</span> <input type="password" class="form-control"
							placeholder="Password" name="pword" id="pword" aria-describedby="basic-addon1" />
					</div>
					<button type="submit">Sign in</button>
					<button type="reset">Reset</button><br/>
					<a href="Forgotpassword">Forgot Password</a>
					<a href="Signup">Not registered ? New User click here</a>					
				</form>
			</div>
			<!-- modal body -->
		</div>
		<!-- end modal content -->
	</div>
	<!-- end modal dialog -->
</div>
<!-- end modal -->