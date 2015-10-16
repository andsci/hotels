{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}

<div class="pageTitle">
    <h2>{$lblHotels|ucfirst}: {$lblAdd}</h2>
</div>

{form:add}
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
