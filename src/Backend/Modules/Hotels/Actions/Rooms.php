<?php

namespace Backend\Modules\Hotels\Actions;

use Backend\Core\Engine\Base\ActionIndex as BackendBaseActionIndex;
use Backend\Core\Engine\Language as BL;
use Backend\Core\Engine\Authentication as BackendAuthentication;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\DataGridDB as BackendDataGridDB;
use Backend\Core\Engine\DataGridFunctions as BackendDataGridFunctions;
use Backend\Modules\Hotels\Engine\Model as BackendHotelsModel;

class Rooms extends BackendBaseActionIndex
{
    private $id;

    private $record;

    private $dgRooms;

    public function execute()
    {
        // get parameters
        $this->id = $this->getParameter('id', 'int');

        if ($this->id !== null && BackendHotelsModel::exists('hotels', $this->id)) {
            parent::execute();
            $this->getData();
            $this->loadDatagrid();
            $this->parse();
            $this->display();
        } else {
            // no item found, throw an exception, because somebody is fucking with our URL
            $this->redirect(BackendModel::createURLForAction('Index') . '&error=non-existing');
        }
    }

    private function getData()
    {
        $this->record = BackendHotelsModel::getRecord('hotels', $this->id);
    }

    private function loadDatagrid()
    {
        // create datagrid
        $this->dgRooms = new BackendDataGridDB(BackendHotelsModel::QRY_DATAGRID_BROWSE_ROOMS, array($this->id));

        // set column URLs
        $this->dgRooms->setColumnURL(
            'title',
            BackendModel::createURLForAction('RoomEdit') .
            '&amp;id=[id]'
        );

        $this->dgRooms->setColumnFunction(
            array(new BackendDataGridFunctions(), 'showImage'),
            array(FRONTEND_FILES_URL . '/rooms/images/64x64' ,'[image]'),
            'image',
            true
        );

        // add edit column
        $this->dgRooms->addColumn(
            'edit',
            null,
            BL::lbl('Edit'),
            BackendModel::createURLForAction('RoomEdit') .
            '&amp;id=[id]',
            BL::lbl('RoomEdit')
        );
    }

    protected function parse()
    {
        parent::parse();
        $this->tpl->assign('item', $this->record);
        $this->tpl->assign('dgRooms', (string) $this->dgRooms->getContent());
    }
}
