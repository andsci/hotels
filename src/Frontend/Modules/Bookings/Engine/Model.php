<?php

namespace Frontend\Modules\Bookings\Engine;
use Frontend\Core\Engine\BasicModel as BasicModel;
use Frontend\Core\Engine\Model as FrontendModel;

class Model extends  BasicModel
{
    const API_URL = 'http://hotel.dev.lt/hotels-api';
    const API_SECRET = '';

    private static function getData($action = '', $id = null)
    {
        if($action) $action = '/'.$action;
        if($id) $action = $action. '/'.$id;

        $r = file_get_contents(self::API_URL.$action);
        $data = json_decode($r, true);

        return $data;
    }

    public static function getHotels()
    {
        $data = self::getData();

        return $data;
    }

    public static function getRooms($hotelId)
    {
        $data = self::getData('Detail', $hotelId);

        return $data;
    }
}