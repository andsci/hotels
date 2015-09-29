{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}

<div class="pageTitle">
    <h2>
        {$lblHotels|ucfirst}:
    </h2>

    <div class="buttonHolderRight">
        <a href="{$var|geturl:'add'}" class="button icon iconAdd" title="{$lblAdd|ucfirst}"><span>{$lblAdd|ucfirst}</span></a>
    </div>
</div>

{option:dgHotels}
    <div class="dataGridHolder">
        {$dgHotels}
    </div>
{/option:dgHotels}
{option:!dgHotels}
    {$lblNoRecords|ucfirst}
{/option:!dgHotels}

{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}
