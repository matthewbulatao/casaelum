function showMessage(_type,_message){
	$.notify(_message, {
		type: _type,
		placement: {
			align: 'center'
		},
		offset: {
			y: 60
		}
	});
}

$(document).ready(function() {
    $('.icon-calendar').click(function(){
    	$(this).next().datepicker().focus();    	
    });    
    $('i[id^=iconMath_]').click(function(){
    	let operation = $(this).attr('id').split('_')[1];
    	let type = $(this).attr('id').split('_')[2];
    	let value = parseInt($('input[name=count'+type+']').val());
    	$('input[name=count'+type+']').val((value>0 && !isNaN(value)) ? (operation == 'add' ? value+1 : value-1) : (operation == 'add' ? 1 : 0));
    });
    $('.delete-icon').click(function(){
    	if(confirm("Are you sure to delete?")){
    		$(this).closest('form').submit();
    	}
    });  
    $('#btnCheckout').click(function(){
    	if(confirm("Are you sure to checkout?")){
    		$(this).closest('form').submit();
    	}
    });
    $('input.datepicker').datepicker({
    	format: 'm/d/yyyy',
    	startDate: new Date()
    });
    $('#submitButtonFromHome').click(function(){
    	if($('input[name=checkIn]').val()==""){
    		showMessage('danger','<strong>Sorry</strong>, please specify CHECK-IN date');
    		return false;
    	}
    	if($('input[name=checkOut]').val()==""){
    		showMessage('danger','<strong>Sorry</strong>, please specify CHECK-OUT date');
    		return false;
    	}
    	var countAdult = $('input[name=countAdult]').val();
    	if(countAdult=="" || parseInt(countAdult)==0){
    		showMessage('danger','<strong>Sorry</strong>, please specify atleast 1 adult');
    		return false;
    	}
    });   
    $('#btnProceedToPayment').click(function(){
    	if($('input[name=selectedRoomIds]:checked').length == 0){
    		showMessage('danger','<strong>Sorry</strong>, please select atleast 1 room');
    		return false;
    	}
    });
    $('#btnProceedConfirm').click(function(){
    	if($('input[name=email]').val()==""){
    		showMessage('danger','<strong>Sorry</strong>, please specify your Email');
    		return false;
    	}
    	if($('input[name=firstName]').val()==""){
    		showMessage('danger','<strong>Sorry</strong>, please specify your first name');
    		return false;
    	}
    	if($('input[name=lastName]').val()==""){
    		showMessage('danger','<strong>Sorry</strong>, please specify your last name');
    		return false;
    	}
    	if($('input[name=contactNumber]').val()==""){
    		showMessage('danger','<strong>Sorry</strong>, please specify your contact number');
    		return false;
    	}
    });
    $('#btnPrintBooking').click(function(){
    	$('#stepsPanel').hide();
    	$(this).hide();
    	
    	window.print();
    	
    	$('#stepsPanel').show();
    	$(this).show();
    });
    $('#btnPrintReservations').click(function(){
    	$(this).hide(); 
    	$('#btnRefresh').hide();
    	$('.dropdown-filter-icon').hide();
    	window.print();
    	$(this).show();
    	$('.dropdown-filter-icon').show();
    	$('#btnRefresh').show();
    });
    
    $('div#myCarousel').carousel();
    $('table').excelTableFilter({
    	columnSelector: '.apply-filter'
    });
    $('#chkNotRobot').change(function(){
    	if(this.checked){
    		$('#btnSubmitMessage').removeClass('disabled');
    		$('#btnSubmitMessage').removeAttr('disabled');
    	}else{
    		$('#btnSubmitMessage').addClass('disabled');
    		$('#btnSubmitMessage').attr('disabled','disabled');
    	}
    });
    $('#formContact input[name=fullName]').val('');
    $('#formContact input[name=email]').val('');
    $('#formContact input[name=contactNumber]').val('');
    $('#formContact input[name=message]').val('');
    $('#formContact input#chkNotRobot').attr('checked',false);
    $('#formContact button#btnSubmitMessage').addClass('disabled');
	$('#formContact button#btnSubmitMessage').attr('disabled','disabled');
	
	if($('#messageSent').val()){
		showMessage('success','<strong>Thanks</strong>, your message has been sent successfully');
	}
    
    /*paypal.Button.render({
        env: 'sandbox', // Or 'production',
        commit: true, // Show a 'Pay Now' button
        style: {
          color: 'gold',
          size: 'small'
        },
        client: {
        	sandbox: 'SCC3BHU38BZNS'
        },
        payment: function(data, actions) {
        	return actions.payment.create({
                payment: {
                    transactions: [
                        {
                            amount: { total: $('#dpAmountForPaypal').val(), currency: 'PHP' }
                        }
                    ]
                }
            });
        },
        onAuthorize: function(data, actions) {
        	return actions.payment.execute().then(function(payment) {
        		$('#formPayment').submit();
            });
        },
        onCancel: function(data, actions) {
           
           * Buyer cancelled the payment 
           
        },
        onError: function(err) {
           
           * An error occurred during the transaction 
           
        }
      }, '#paypal-button');*/
    
});