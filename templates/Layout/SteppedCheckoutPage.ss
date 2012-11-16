<% require ThemedCSS(checkout) %>
<h1>$Title</h1>

<% if Cart %>

	<div class="row">
		<div class="span10">
	
			<div id="Checkout" class="accordion">
			
				<div class="accordion-group">
					<div class="accordion-heading">
						<h3 class="accordion-toggle" id="cont">
							<a href="cart" title="edit cart contents">Cart</a></h3>
					</div>
					<div class="accordion-body">
						<div class="accordion-inner">
							<% control Cart %>
								<% include Cart_ReadOnly %>
							<% end_control %>
						</div>
					</div>
				</div>
				
				<div class="accordion-group">
					<div class="accordion-heading">
						<% if IsPastStep(contactdetails) %>
							<h3><a href="$Link(contactdetails)" class="accordion-toggle" title="edit contact details">Contact</a></h3>
						<% else %>
							<h3 class="accordion-toggle">Contact</h3>
						<% end_if %>
					</div>
					<% if IsFutureStep(contactdetails) %>
					
					<% else %>
						<div class="accordion-body">
							<div class="accordion-inner">
								<% if IsCurrentStep(contactdetails) %>
									<p>Supply your contact information</p>
									$Form
								<% end_if %>
								<% if IsPastStep(contactdetails) %>
									<% control Cart %>
										$Name ($Email)
									<% end_control %>
								<% end_if %>
							</div>
						</div>
					<% end_if %>
				</div>
				
				<div class="accordion-group">
					<div class="accordion-heading">
						<% if IsPastStep(shippingaddress) %>
							<h3><a class="accordion-toggle" title="edit address(es)" href="$Link(shippingaddress)">Address</a></h3>
						<% else %>
							<h3 class="accordion-toggle">Address</h3>
						<% end_if %>
					</div>
					<% if IsFutureStep(shippingaddress) %>
					
					<% else %>
						<div class="accordion-body">
							<div class="accordion-inner">
								<% if IsCurrentStep(shippingaddress) %>
									<p>Please enter your shipping address details.</p>
									$Form
								<% end_if %>
								<% if IsPastStep(shippingaddress) %>
									<div class="row">
										<div class="span4">
											<% control Cart %>
												<h4>Ship To:</h4>
												$ShippingAddress
											<% end_control %>
										</div>
										<div class="span4">
										<h4>Bill To:</h4>
											<% if IsCurrentStep(billingaddress) %>
												$Form
											<% else %>
												<% control Cart %>
													$BillingAddress
												<% end_control %>
											<% end_if %>
										</div>
									</div>
								<% end_if %>
							</div>
						</div>
					<% end_if %>
				</div>
				
				<div class="accordion-group">
					<div class="accordion-heading">
						<% if IsPastStep(shippingmethod) %>
							<h3><a class="accordion-toggle" title="choose shipping method" href="$Link(shippingmethod)">Shipping</a></h3>
						<% else %>
							<h3 class="accordion-toggle">Shipping</h3>
						<% end_if %>
					</div>
					<% if IsFutureStep(shippingmethod) %>
					
					<% else %>
						<div class="accordion-body">
							<div class="accordion-inner">
								<% if IsCurrentStep(shippingmethod) %>
									$Form
								<% end_if %>
								<% if IsPastStep(shippingmethod) %>
									<% control Cart %>
										<p>$ShippingMethod.Title</p>
									<% end_control %>
								<% end_if %>
							</div>
						</div>
					<% end_if %>
				</div>
			
				<div class="accordion-group">
					<div class="accordion-heading">
						<% if IsPastStep(paymentmethod) %>
							<h3><a class="accordion-toggle" title="choose payment method" href="$Link(paymentmethod)">Payment</a></h3>
						<% else %>
							<h3 class="accordion-toggle">Payment</h3>
						<% end_if %>
					</div>
					<% if IsFutureStep(paymentmethod) %>
					
					<% else %>
						<div class="accordion-body">
							<div class="accordion-inner">
								<% if IsCurrentStep(paymentmethod) %>
									$Form
								<% end_if %>
								<% if IsPastStep(paymentmethod) %>
									$SelectedPaymentMethod
								<% end_if %>		
							</div>
						</div>				
					<% end_if %>
				</div>
				
				<div class="accordion-group">
					<div class="accordion-heading">
						<h3 class="accordion-toggle">Summary</h3>
					</div>
					<% if IsFutureStep(summary) %>
					
					<% else %>
						<div class="accordion-body">
							<div class="accordion-inner">
								<% if IsCurrentStep(summary) %>
									<% control Cart %>
										<table class="table">
											<tfoot>
												<% control Modifiers %>
													<% if ShowInTable %>
												<tr class="modifierRow $EvenOdd $FirstLast $Classes">
													<td colspan="3">$TableTitle</td>
													<td>$TableValue.Nice</td>
												</tr>
													<% end_if %>
												<% end_control %>
												<tr>
													<th colspan="3">Grand Total</th>
													<td>$Total.Nice $Currency</td>
												</tr>
											</tfoot>
										</table>
									<% end_control %>
									$Form
								<% end_if %>
							</div>
						</div>
					<% end_if %>
				</div>
				
			</div>
		
		</div>
	</div>

<% else %>

	<div class="message warning alert alert-block alert-info">
		<h4 class="alert-heading">Your cart is empty</h4>
		<i class="icon icon-info-sign"></i> <% _t("NOITEMS","There are no items in your cart.") %>
	</div>
	
	<% if ContinueLink %>
	<a class="continuelink btn btn-primary" href="$ContinueLink">
		<i class="icon-arrow-left icon-white"></i>
		<% _t('CartPage.ss.CONTINUE','Continue Shopping') %>
	</a>
	<% end_if %>
	
<% end_if %>