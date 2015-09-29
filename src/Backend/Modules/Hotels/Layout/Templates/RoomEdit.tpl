{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}

<div class="pageTitle">
    <h2><a href="{$var|geturl:'rooms'}&id={$hotel.id}">{$hotel.title}</a>: {$lblEditRoom}: {$item.title}</h2>
</div>

{form:edit}
    <table width="100%">
        <tr>
            <td id="leftColumn">
                {$txtTitle} {$txtTitleError}
            </td>
            <td id="sidebar">
                <div class="box">
                    <div class="heading">
                        <h3>{$lblHotel|ucfirst}</h3>
                    </div>
                    <div class="options">
                        <p>
                            <label for="image">{$lblRoomCount|ucfirst}</label>
                            {$txtCount} {$txtCountError}
                        </p>
                    </div>
                </div>

                <div class="box">
                    <div class="heading">
                        <h3>{$lblRoomSettings|ucfirst}</h3>
                    </div>
                    <div class="options">
                        <p>
                            <label for="image">{$lblCapacity|ucfirst}</label>
                            {$txtCapacity} {$txtCapacityError}
                        </p>
                    </div>
                    <div class="options">
                        <p>
                            <label for="image">{$lblPrice|ucfirst}</label>
                            {$txtPrice} {$txtPriceError}
                        </p>
                    </div>
                </div>

                <div class="box">
                    <div class="heading">
                        <h3>{$lblImage|ucfirst}</h3>
                    </div>
                    <div class="options">
                        <p>
                            {option:item.image}
                                <p class="imageHolder">
                                    <img src="{$FRONTEND_FILES_URL}/rooms/images/128x128/{$item.image}" width="128" height="128" alt="{$lblImage|ucfirst}" />
                                    <label for="deleteImage">{$chkDeleteImage} {$lblDelete|ucfirst}</label>
                                    {$chkDeleteImageError}
                                </p>
                            {/option:item.image}
                            {$fileImage} {$fileImageError}
                        </p>
                    </div>
                </div>
            </td>
        </tr>
    </table>

    <div class="fullwidthOptions">
        <a href="{$var|geturl:'room_delete'}&amp;id={$item.id}" data-message-id="confirmDelete" class="askConfirmation button linkButton icon iconDelete">
            <span>{$lblDelete|ucfirst}</span>
        </a>

        <div id="confirmDelete" title="{$lblDelete|ucfirst}?" style="display: none;">
            <p>
                {$msgConfirmDelete|sprintf:{$item.title}}
            </p>
        </div>

        <div class="buttonHolderRight">
            <input id="editButton" class="inputButton button mainButton" type="submit" name="edit" value="{$lblEdit|ucfirst}" />
        </div>
    </div>
{/form:edit}

{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}
