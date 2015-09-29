{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}

<div class="pageTitle">
    <h2><a href="{$var|geturl:'rooms'}&id={$item.id}">{$item.title}</a>: {$lblAddRoom}</h2>
</div>

{form:add}
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
                            {$fileImage} {$fileImageError}
                        </p>
                    </div>
                </div>
            </td>
        </tr>
    </table>

    <div class="fullwidthOptions">
        <div class="buttonHolderRight">
            <input id="addButton" class="inputButton button mainButton" type="submit" name="add" value="{$lblAdd|ucfirst}" />
        </div>
    </div>
{/form:add}

{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}
