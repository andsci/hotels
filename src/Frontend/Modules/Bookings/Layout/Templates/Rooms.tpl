{option:rooms}
    <table>
        {iteration:rooms}
            <tr class="room">
                <td class="tar pr-15">
                    <img class="room-image" src="{$rooms.image}"/>
                    <input type="radio" name="room" value="{$rooms.id}"/>
                </td>
                <td class="vam tal">
                    <span class="bold">{$rooms.title}</span> ({$rooms.available_rooms} available) {$rooms.price} &euro;
                </td>
            </tr>
        {/iteration:rooms}
    </table>
{/option:rooms}