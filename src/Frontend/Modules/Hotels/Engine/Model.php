<?php

namespace Frontend\Modules\Hotels\Engine;
use Frontend\Core\Engine\BasicModel as BasicModel;
use Frontend\Core\Engine\Model as FrontendModel;

class Model extends  BasicModel
{
    public static function getRooms($hotel_id)
    {
        return (array) FrontendModel::getContainer()->get('database')->getRecords(
            'SELECT hr.*, hr.count AS `available_rooms`
             FROM hotels_rooms AS hr
             WHERE hr.hotel_id = ?', $hotel_id);
    }
}