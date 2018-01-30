<?php

//require ('models/Model.php');

class UsersModels extends Model{

    public function set( $user_data = array()){
        $this->query = "REPLACE INTO users (user_name, user_last_name, user_avatar, user, email, pass, role) 
VALUES ('$user_name', '$user_last_name', '$user_avatar', 'user', '$email', MD5('$pass'), '$role'); 
";
        $this->set_query();

    }

    public function get()
    {
        // TODO: Implement set() method.
    }
}

