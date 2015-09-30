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
    },

    initHotelMouseOver: function() {
        $('#bookings').find('.item-inner')
            .mouseenter(function(){$(this).parent().find('.title').show()})
            .mouseleave(function(){$(this).parent().find('.title').hide()});
    },

    initHotelSelection: function() {
        var bookings = $('#bookings');
        var bookingsFilter = $('#bookings-filter');

        bookings.find('.item-inner').click(function(){
            var item = $(this).closest('.item');
            var id = item.data('id');
            var title = item.find('.title .cell').text();
            jsFrontend.bookings.hotel.id = id;
            jsFrontend.bookings.hotel.title = title;
            $('#bookings-page').find('.hotel-name').text(title);
            bookings.slideUp();
            bookingsFilter.slideDown();
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
                $('#room-list').empty();
                $.ajax(
                    {
                        data:
                        {
                            fork: { module: 'Bookings', action: 'GetRooms' },
                            hotel_id: jsFrontend.bookings.hotel.id
                        },
                        success: function(response){
                            var roomList = $('#room-list');
                            if(response['data']){
                                roomList.append(response['data']);
                            } else {
                                roomList.append('<div>No rooms available</div>');
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
        form.find('input').each(function() {
            if($(this).val() == ''){
                $(this).closest('.form-group').addClass('has-error');
                isValid = false;
            }
        });

        return isValid;
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
            $('#bookings-detail').slideUp();
            $('#bookings-checkout').slideDown();
        });
    },
};

$(jsFrontend.bookings.init);
