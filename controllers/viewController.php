<?php

class viewController{
    private static $view_path = './views/';

    //public function load_view($view){
    //    require_once(self::$view_path . 'header.php');
    //    require_once(self::$view_path . $view);
    //    require_once(self::$view_path . 'footer.php');
    //}

    public function load_view(){
        require_once(self::$view_path . 'header.php');
    }
}

