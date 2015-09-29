<?php

namespace Backend\Modules\Hotels\Actions;

use Backend\Core\Engine\Base\ActionDelete as BackendBaseActionDelete;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Modules\Hotels\Engine\Model as BackendHotelsModel;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Language as BL;

class Delete extends BackendBaseActionDelete
{
    public function execute()
    {
        // get parameters
        $this->id = $this->getParameter('id', 'int');

        // does the item exist
        if ($this->id !== null && BackendHotelsModel::exists('hotels', $this->id)) {
            // call parent, this will probably add some general CSS/JS or other required files
            parent::execute();

            // get data
            $this->record = (array) BackendHotelsModel::getRecord('hotels', $this->id);

            if($this->record['image']){
                // the image path
                $imagePath = FRONTEND_FILES_PATH . '/hotels/images';

                BackendModel::deleteThumbnails($imagePath, $this->record['image']);
            }

            $rooms = BackendHotelsModel::getRecords('hotels_rooms', $this->id, 'hotel_id = ?');

            foreach($rooms AS $room) {
                $imagePath = FRONTEND_FILES_PATH . '/rooms/images';

                BackendModel::deleteThumbnails($imagePath, $room['image']);
            }

            // delete rooms
            BackendHotelsModel::deleteRecord('hotels_rooms', $this->id, 'hotel_id = ?');

            // delete item
            BackendHotelsModel::deleteRecord('hotels', $this->id);

            // build redirect URL
            $redirectUrl = BackendModel::createURLForAction('Index') . '&report=deleted&var=' . urlencode($this->record['title']);

            // item was deleted, so redirect
            $this->redirect($redirectUrl);
        } else {
            // something went wrong
            $this->redirect(BackendModel::createURLForAction('Index') . '&error=non-existing');
        }
    }
}
