<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>jQuery Mobile Bootstrap Theme</title>
		<link href="<?php echo base_url(); ?>application/assets/css/themes/Bootstrap.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.0/jquery.mobile.structure-1.4.0.min.css" />
		<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.4.0/jquery.mobile-1.4.0.min.js"></script>
	</head>
	<body>
		<div data-role="page" data-theme="a">
			<div data-role="header" data-position="inline">
				<h1>jQuery Mobile Bootstrap Theme</h1>
				<div data-role="navbar">
					<ul>
						<li><a href="index.html" data-icon="home">Home</a></li>
						<li><a href="buttons.html" data-icon="star" class="ui-btn-active">Buttons</a></li>
						<li><a href="listviews.html" data-icon="grid">Lists</a></li>
						<li><a href="nav.html" data-icon="search">Nav</a></li>
						<li><a href="forms.html" data-icon="gear">Forms</a></li>
					</ul>
				</div>
			</div>
			<div class="dropdown">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			    Dropdown
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
			  </ul>
			</div>
			<div data-role="content" data-theme="a">

				<a href="https://github.com/commadelimited/jQuery-Mobile-Bootstrap-Theme" data-role="button" data-icon="star">Get the code</a>

				<h2>Buttons</h2>

				<a href="index.html" data-role="button" data-theme="a" data-icon="star">Swatch A</a>
				<a href="index.html" data-role="button" data-theme="b" data-icon="search">Swatch B</a>
				<a href="index.html" data-role="button" data-theme="c" data-icon="check">Swatch C</a>
				<a href="index.html" data-role="button" data-theme="d" data-icon="info">Swatch D</a>
				<a href="index.html" data-role="button" data-theme="e" data-icon="arrow-d">Swatch E</a>
				<a href="index.html" data-role="button" data-theme="f" data-icon="delete">Swatch F</a>
			</div>
		</div>
	</body>
</html>