{option:museums}
    <div class="tac list-title">Museums in {$hotel.city}, {$hotel.country}</div>
    {iteration:museums}
        <div class="museum">
            <a href="{$museums.url}">
                <img class="museum-image" src="{$museums.image}">
            </a>
            <div class="description">
                <span class="title">{$museums.name}</span>
                <span class="address">{$museums.address}</span>
            </div>
        </div>
    {/iteration:museums}
{/option:museums}

{option:!museums}
    <div class="tac">No museus in {$hotel.city}, {$hotel.country}</div>
{/option:!museums}