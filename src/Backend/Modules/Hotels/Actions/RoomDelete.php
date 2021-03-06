<?php

namespace Backend\Modules\Hotels\Actions;

use Backend\Core\Engine\Base\ActionDelete as BackendBaseActionDelete;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Modules\Hotels\Engine\Model as BackendHotelsModel;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Language as BL;

class RoomDelete extends BackendBaseActionDelete
{
    public function execute()
    {
        // get parameters
        $this->id = $this->getParameter('id', 'int');

        // does the item exist
        if ($this->id !== null && BackendHotelsModel::exists('hotels_rooms', $this->id)) {
            // call parent, this will probably add some general CSS/JS or other required files
            parent::execute();

            // get data
            $this->record = (array) BackendHotelsModel::getRecord('hotels_rooms', $this->id);

            if($this->record['image']){
                // the image path
                $imagePath = FRONTEND_FILES_PATH . '/rooms/images';

                BackendModel::deleteThumbnails($imagePath, $this->record['image']);
            }

            // delete item
            BackendHotelsModel::deleteRecord('hotels_rooms', $this->id);

            // build redirect URL
            $redirectUrl = BackendModel::createURLForAction('Rooms') . '&report=deleted&var=' . urlencode($this->record['title'] . '&id='. $this->record['id']);

            // item was deleted, so redirect
            $this->redirect($redirectUrl);
        } else {
            // something went wrong
            $this->redirect(BackendModel::createURLForAction('Rooms') . '&error=non-existing&id='. $this->record['id']);
        }
    }
}
