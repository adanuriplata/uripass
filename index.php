
<?php

require_once('./controllers/Autoload.php');
$autoload = new autoload();


$llamada = new viewController();

$llamada->load_view();


