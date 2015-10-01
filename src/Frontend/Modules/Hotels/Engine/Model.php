<?php

namespace Frontend\Modules\Hotels\Engine;
use Frontend\Core\Engine\BasicModel as BasicModel;
use Frontend\Core\Engine\Model as FrontendModel;

class Model extends  BasicModel
{
    public static function getRooms($hotel_id, $start, $end)
    {
        $start = strtotime($start);
        $end = strtotime($end);

        return (array) FrontendModel::getContainer()->get('database')->getRecords(
            'SELECT hr.id, hr.title, hr.price, hr.image, hr.count, (hr.count - COUNT(hrb.id)) AS `available_rooms`
             FROM hotels_rooms AS hr
             LEFT JOIN hotels_rooms_bookings AS hrb ON hrb.room_id = hr.id AND ((UNIX_TIMESTAMP(hrb.end) > ? AND UNIX_TIMESTAMP(hrb.end) < ? ) OR ( UNIX_TIMESTAMP(hrb.start) > ? AND UNIX_TIMESTAMP(hrb.start) < ?) OR ( UNIX_TIMESTAMP(hrb.start) < ? AND UNIX_TIMESTAMP(hrb.end) > ?))
             WHERE hr.hotel_id = ?
             GROUP BY hr.id', array($start, $end, $start, $end, $start, $end, $hotel_id));
    }

    public static function getRoom($room_id)
    {
        $room = (array) FrontendModel::getContainer()->get('database')->getRecord(
            'SELECT hr.id, hr.title, hr.price, hr.image, hr.count
             FROM hotels_rooms AS hr
             WHERE hr.id = ?', array($room_id));

        if($room){
            $room['image'] = FRONTEND_FILES_URL . '/rooms/images/source/' . $room['image'];
        }

        return $room;
    }
}