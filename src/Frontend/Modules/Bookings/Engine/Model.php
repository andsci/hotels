<?php

namespace Frontend\Modules\Bookings\Engine;
use Frontend\Core\Engine\BasicModel as BasicModel;
use Frontend\Core\Engine\Model as FrontendModel;

class Model extends  BasicModel
{
    const API_SECRET = '';

    private static function getData($action = '', $id = null, $params = '')
    {
        if($action) $action = '/'.$action;
        if($id) $action = $action. '/'.$id;

        $r = file_get_contents(HOTELS_API_URL.'/'.HOTELS_API_PAGE.$action.$params);
        $data = json_decode($r, true);

        return $data;
    }

    private static function sendData($action = '', $param_string, $param_number)
    {
        if($action) $action = '/'.$action;

        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch,CURLOPT_URL, HOTELS_API_URL.'/'.HOTELS_API_PAGE.$action);
        curl_setopt($ch,CURLOPT_POST, $param_number);
        curl_setopt($ch,CURLOPT_POSTFIELDS, $param_string);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        // remove null null echo
        ob_start();
        $result = curl_exec($ch);
        ob_end_clean();

        //close connection
        curl_close($ch);

        return $result;
    }

    public static function getHotels()
    {
        $data = self::getData();

        return $data;
    }

    public static function getRooms($hotelId, $arival, $departure)
    {
        $params = '?start='.$arival.'&end='.$departure;

        $data = self::getData('Detail', $hotelId, $params);

        return $data;
    }

    public static function getHotel($hotelId)
    {
        $data = self::getData('', $hotelId);

        return $data;
    }

    public static function getRoom($roomId)
    {
        $data = self::getData('Rooms', $roomId);

        return $data;
    }

    public static function reserveRoom($data)
    {
        $param_string = '';
        foreach($data as $key=>$value) { $param_string .= $key.'='.$value.'&'; }
        rtrim($param_string, '&');

        $result = self::sendData('Rooms', $param_string, Count($data));

        return $result;
    }

    public static function getMuseums($country, $city)
    {
        $r = file_get_contents('http://www.muselia.com/apimuseums?city='.strtolower($city).'&country='.strtolower($country));
        $data = json_decode($r, true);
        if(isset($data['error'])){
            return false;
        }
        return $data;
    }
}