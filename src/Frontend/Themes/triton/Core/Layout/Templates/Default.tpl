{include:Core/Layout/Templates/Head.tpl}

<body class="{$LANGUAGE}" itemscope itemtype="http://schema.org/WebPage">
{include:Core/Layout/Templates/Cookies.tpl}

<div class="container">
	<div class="header clearfix">
		<nav>
			{$var|getnavigation:'page':0:1}
		</nav>
		<h3 class="text-muted">Hotels</h3>
	</div>

	{* Main position *}
	{iteration:positionMain}
	{option:positionMain.blockIsEditor}
	{$positionMain.blockContent}
	{/option:positionMain.blockIsEditor}
	{option:!positionMain.blockIsEditor}
	{$positionMain.blockContent}
	{/option:!positionMain.blockIsEditor}
	{/iteration:positionMain}

	{include:Core/Layout/Templates/Footer.tpl}
</div> <!-- /container -->

{* General Javascript *}
{iteration:jsFiles}
	<script src="{$jsFiles.file}"></script>
{/iteration:jsFiles}

{* Theme specific Javascript *}
<script src="{$THEME_URL}/Core/Js/triton.js"></script>
<script src="{$THEME_URL}/Core/Js/Plugins/bootstrap.min.js"></script>
<script src="{$THEME_URL}/Core/Js/Plugins/bootstrap-datepicker.js"></script>

{* Site wide HTML *}
{$siteHTMLFooter}

</body>
</html>




