{option:navigation}
    <ul class="nav nav-pills pull-right">
        {iteration:navigation}
            <li role="presentation"{option:navigation.selected} class="active"{/option:navigation.selected}><a href="{$navigation.link}"{option:navigation.nofollow} rel="nofollow"{/option:navigation.nofollow}>{$navigation.navigation_title}</a></li>
        {/iteration:navigation}
    </ul>
{/option:navigation}