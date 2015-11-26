jsFrontend.bookings =
{
    hotel: {
        'id': 0,
        'title': ''
    },

    init: function()
    {
        jsFrontend.bookings.initHotelMouseOver();
        jsFrontend.bookings.initHotelSelection();
        jsFrontend.bookings.initBackButton();
        jsFrontend.bookings.initSearchButton();
        jsFrontend.bookings.initDateValidation();
        jsFrontend.bookings.initRoomSelect();
        jsFrontend.bookings.initReservation();
    },

    initHotelMouseOver: function() {
        $('#bookings').find('.item-inner')
            .mouseenter(function(){$(this).parent().find('.title').show()})
            .mouseleave(function(){$(this).parent().find('.title').hide()});
    },

    initHotelSelection: function() {
        var bookings = $('#bookings');
        var bookingsFilter = $('#bookings-filter');

        bookings.find('.item-inner').click(function(e){
            e.preventDefault();
            var item = $(this).closest('.item');
            var id = item.data('id');
            var title = item.find('.title .cell').text();
            jsFrontend.bookings.hotel.id = id;
            jsFrontend.bookings.hotel.title = title;

            $.ajax(
                {
                    data:
                    {
                        fork: { module: 'Bookings', action: 'GetMuseums' },
                        hotel_id: jsFrontend.bookings.hotel.id,
                    },
                    success: function(response){
                        var museumList = $('#museum-list');
                        museumList.html(response['data']);

                        $('#bookings-page').find('.hotel-name').text(title);
                        bookings.slideUp();
                        bookingsFilter.slideDown();
                    },
                    error: function(error){
                        console.log(error);
                    }
                });
        });
    },

    initBackButton: function() {
        $('.back-button').click(function(){
            var currentPage = $(this).closest('.sub-page');
            var prevPage = currentPage.prev();

            currentPage.slideUp();
            prevPage.slideDown();
        });
    },

    initSearchButton: function() {
        $('.search-btn').click(function(){
            if(jsFrontend.bookings.validateForm($('form.date-form'))){
                var arrival = $('input.date-start').val();
                var departure = $('input.date-end').val();

                $('#room-list').empty();
                $.ajax(
                    {
                        data:
                        {
                            fork: { module: 'Bookings', action: 'GetRooms' },
                            hotel_id: jsFrontend.bookings.hotel.id,
                            arrival: arrival,
                            departure: departure
                        },
                        success: function(response){
                            var roomList = $('#room-list');
                            if(response['data']){
                                roomList.html(response['data']);
                            } else {
                                roomList.html('<div class="tac">No rooms available</div>');
                            }
                            $('#bookings-filter').slideUp();
                            $('#bookings-detail').slideDown();
                        },
                        error: function(error){
                            console.log(error);
                        }
                    });
            }
        });
    },

    initDateValidation: function()
    {
        $('input').change(function(){
            $(this).closest('.form-group').removeClass('has-error');
        });
    },

    validateForm: function(form)
    {
        var isValid = true;
        form.find('input[type="text"]').each(function() {
            if($(this).val() == ''){
                $(this).closest('.form-group').addClass('has-error');
                isValid = false;
            } else {
                $(this).closest('.form-group').removeClass('has-error');
            }
        });

        form.find('input[type="email"]').each(function() {
            if(!jsFrontend.bookings.isValidEmailAddress($(this).val())){
                $(this).closest('.form-group').addClass('has-error');
                isValid = false;
            } else {
                $(this).closest('.form-group').removeClass('has-error');
            }
        });

        return isValid;
    },

    isValidEmailAddress: function(emailAddress) {
            var pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);
            return pattern.test(emailAddress);
    },

    initRoomSelect: function()
    {
        $('#bookings-detail').on('click', '.room-image', function(){
            $('.room-image.selected').removeClass('selected');
            $(this).addClass('selected');
            //$('#bookings-detail').find('input').attr('checked', false);
            $(this).parent().find('input').attr('checked', true);
        });

        $('.select-btn').click(function(){
            var roomId = $('input:radio[name="room"]:checked').val();
            if(roomId){
                var arrival = $('input.date-start').val();
                var departure = $('input.date-end').val();

                $.ajax(
                    {
                        data:
                        {
                            fork: { module: 'Bookings', action: 'GetRoom' },
                            room_id: roomId,
                            arrival: arrival,
                            departure: departure
                        },
                        success: function(response){
                            var order = $('#order-detail');
                            order.html(response['data']);

                            $('#bookings-detail').slideUp();
                            $('#bookings-checkout').slideDown();
                        },
                        error: function(error){
                            console.log(error);
                        }
                    });
            }
        });
    },

    initReservation: function()
    {
        $('.reserve-btn').click(function(){
            var roomId = $('input:radio[name="room"]:checked').val();
            var arrival = $('input.date-start').val();
            var departure = $('input.date-end').val();
            var clientName = $('input#client-name').val();
            var clientEmail = $('input#client-email').val();

            if(jsFrontend.bookings.validateForm($('#client-form'))) {
                $.ajax(
                    {
                        data:
                        {
                            fork: { module: 'Bookings', action: 'SendReservation' },
                            room_id: roomId,
                            arrival: arrival,
                            departure: departure,
                            client_name: clientName,
                            client_email: clientEmail
                        },
                        success: function(response){
                            $('#bookings-checkout').slideUp();
                            $('#bookings-success').slideDown();
                        },
                        error: function(error){
                            console.log(error);
                        }
                    });
            }
        });
    }
};

$(jsFrontend.bookings.init);
