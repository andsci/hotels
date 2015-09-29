{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}

<div class="pageTitle">
    <h2>
        {$item.title}: {$lblRooms|ucfirst}
    </h2>

    <div class="buttonHolderRight">
        <a href="{$var|geturl:'room_add'}&id={$item.id}" class="button icon iconAdd" title="{$lblAdd|ucfirst}"><span>{$lblAdd|ucfirst}</span></a>
        <a href="{$var|geturl:'index'}" class="button icon iconAdd">{$lblBack|ucfirst}</a>
    </div>
</div>

{option:dgRooms}
    <div class="dataGridHolder">
        {$dgRooms}
    </div>
{/option:dgRooms}
{option:!dgRooms}
    {$lblNoRecords|ucfirst}
{/option:!dgRooms}

{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}
