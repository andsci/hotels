<div id="bookings-page">
    <div id="bookings" class="clearfix sub-page">
        {option:hotels}
            <div class="">
                {iteration:hotels}
                    <div class="item" data-id="{$hotels.id}">
                        <a style="background-image: url('{$hotels.image}');" class="item-inner" data-id="{$hotels.id}">
                        </a>
                        <div class="title">
                            <div class="wrapper">
                                <div class="cell">
                                    {$hotels.title}
                                </div>
                            </div>
                        </div>
                    </div>
                {/iteration:hotels}
            </div>
        {/option:hotels}
    </div>

    <div id="bookings-filter" class="clearfix sub-page">
        <div class="navigation">
            <button class="btn btn-default back-button">Back</button>
            <span class="title">Hotel "<span class="hotel-name"></span>"</span>
        </div>
        <div class="tac">
            <form class="form-inline date-form">
                <div class="form-group">
                    <input type="text" class="form-control date-start datepicker" id="exampleInputEmail3" placeholder="From">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control date-end datepicker" id="exampleInputPassword3" placeholder="To">
                </div>
            </form>
            <button type="button" class="btn btn-default btn-lg search-btn">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span> Search
            </button>

            <div id="museum-list"></div>
        </div>
    </div>

    <div id="bookings-detail" class="clearfix sub-page">
        <div class="navigation">
            <button class="btn btn-default back-button">Back</button>
            <span class="title">Hotel "<span class="hotel-name"></span>" rooms</span>
        </div>
        <div id="room-list"></div>
        <div class="wrapper tac">
            <button type="button" class="btn btn-default btn-lg select-btn">
                <span class="" aria-hidden="true"></span> Select
            </button>
        </div>
    </div>

    <div id="bookings-checkout" class="clearfix sub-page">
        <div class="navigation">
            <button class="btn btn-default back-button">Back</button>
            <span class="title">Order</span>
        </div>
        <div class="sub-title">Room information</div>
        <div id="order-detail" class="clearfix"></div>
        <div class="sub-title">Client information</div>
        <form id="client-form" class="form-horizontal">
            <div class="form-group">
                <label for="client-name" class="col-sm-2 control-label">Your name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="client-name" placeholder="Name">
                </div>
            </div>
            <div class="form-group">
                <label for="client-email" class="col-sm-2 control-label">Your email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="client-email" placeholder="Email">
                </div>
            </div>
        </form>
        <div class="wrapper tac">
            <button type="button" class="btn btn-default btn-lg reserve-btn">
                <span class="" aria-hidden="true"></span> Reserve
            </button>
        </div>
    </div>
    <div id="bookings-success" class="clearfix sub-page">
        <div class="navigation">
            <span class="title">Reservation successfull</span>
        </div>
        <div class="success-message tac">
            Your room has been reserved.
        </div>
    </div>
</div>
