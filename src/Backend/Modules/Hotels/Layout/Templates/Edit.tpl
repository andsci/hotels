{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}

<div class="pageTitle">
    <h2>{$lblHotels|ucfirst}: {$lblEdit}: {$item.title}</h2>
</div>

{form:edit}
    <table width="100%">
        <tr>
            <td id="leftColumn">
                <div class="box">
                    {$txtTitle} {$txtTitleError}
                </div>
                <div class="box">
                    <label for="country">Country</label>
                    {$txtCountry} {$txtCountryError}
                </div>
                <div class="box">
                    <label for="city">City</label>
                    {$txtCity} {$txtCityError}
                </div>
            </td>
            <td id="sidebar">
                <div class="box">
                    <div class="heading">
                        <h3>{$lblImage|ucfirst}</h3>
                    </div>
                    <div class="options">
                        <p>

                            <label for="image">{$lblImage|ucfirst}</label>
                            {option:item.image}
                                <p class="imageHolder">
                                    <img src="{$FRONTEND_FILES_URL}/hotels/images/128x128/{$item.image}" width="128" height="128" alt="{$lblImage|ucfirst}" />
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
        <a href="{$var|geturl:'delete'}&amp;id={$item.id}" data-message-id="confirmDelete" class="askConfirmation button linkButton icon iconDelete">
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
