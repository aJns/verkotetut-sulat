<?php
// ESP expects the content on the site to be [led_state]<1 or 0>, eg  [led_state]0
error_reporting(-1);
ini_set('display_errors', 'On');

$filename = "led_state.txt";

if (!file_exists($filename)) {
    file_put_contents($filename, "0");
}

switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST':
        if (!isset($_POST["led_state"])) {
            echo "Didn't get post parameters";
            break;
        }
        $new_state = $_POST["led_state"];
        file_put_contents($filename, $new_state);
        break;

    case 'GET':
        echo file_get_contents($filename);
        break;

    default:
        echo "Got irrelevant request";
        break;
}

?>
