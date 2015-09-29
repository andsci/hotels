<?php

namespace Backend\Modules\Hotels\Engine;

use Backend\Core\Engine\Exception;
use Backend\Core\Engine\Authentication as BackendAuthentication;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\Language as BL;
use Backend\Modules\Tags\Engine\Model as BackendTagsModel;
use Backend\Core\Engine\BasicModel as BasicModel;

class Model extends  BasicModel
{
    const QRY_DATAGRID_BROWSE_HOTELS =
        'SELECT h.id, h.image, h.title, COUNT(hr.id) AS `room_count`
         FROM hotels AS h
         LEFT JOIN hotels_rooms AS hr ON hr.hotel_id = h.id
         GROUP BY h.id';

    const QRY_DATAGRID_BROWSE_ROOMS =
        'SELECT hr.id, hr.image, hr.title, hr.count AS `rooms`, hr.price
         FROM hotels_rooms AS hr
         WHERE hotel_id = ?';
}