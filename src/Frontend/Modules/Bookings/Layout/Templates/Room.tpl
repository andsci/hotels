{option:room}
    <div class="room-image-holder fl">
        <img class="room-image" src="{$room.image}"/>
    </div>
    <table class="room-table fl">
        <tr>
            <td>Name</td><td>{$room.title}</td>
        </tr>
        <tr>
            <td>Arrival</td><td>{$room.arrival}</td>
        </tr>
        <tr>
            <td>Departure</td><td>{$room.departure}</td>
        </tr>
        <tr>
            <td>Nights</td><td>{$room.stay_duration}</td>
        </tr>
        <tr>
            <td>Total Price</td><td>{$room.total_price} &euro;</td>
        </tr>
    </table>
{/option:room}