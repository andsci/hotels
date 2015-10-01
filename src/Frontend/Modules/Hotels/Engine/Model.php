<?php

namespace Frontend\Modules\Hotels\Engine;
use Frontend\Core\Engine\BasicModel as BasicModel;
use Frontend\Core\Engine\Model as FrontendModel;

class Model extends  BasicModel
{
    public static function getRooms($hotel_id)
    {
        return (array) FrontendModel::getContainer()->get('database')->getRecords(
            'SELECT hr.id, hr.title, hr.price, hr.image, hr.count AS `available_rooms`
             FROM hotels_rooms AS hr
             WHERE hr.hotel_id = ?', $hotel_id);
    }

    public static function getRoom($room_id)
    {
        $room = (array) FrontendModel::getContainer()->get('database')->getRecord(
            'SELECT hr.id, hr.title, hr.price, hr.image, hr.count AS `available_rooms`
             FROM hotels_rooms AS hr
             WHERE hr.id = ?', $room_id);

        if($room){
            $room['image'] = FRONTEND_FILES_URL . '/rooms/images/source/' . $room['image'];
        }

        return $room;
    }
}