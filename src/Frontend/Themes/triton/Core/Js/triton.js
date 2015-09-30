$(document).ready(function(){
	var date = new Date();
	$('.datepicker').datepicker({
        startDate : date,
        format: 'yyyy/mm/dd'
    }).data('datepicker');

    var startInput = $('input.date-start');
    var endInput = $('input.date-end');

    startInput.change(function(){
        var date = new Date(this.value);
        date.setDate(date.getDate() + 1);
        endInput.data('datepicker').setStartDate(date);

        if(new Date(endInput.val()) < date) {
            console.log('nulinasi');
            endInput.val('');
        }
    });
});