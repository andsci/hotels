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

class Index extends BackendBaseActionIndex
{
    private $dgHotels;

    public function execute()
    {
        parent::execute();

        $this->loadDatagrid();
        $this->parse();
        $this->display();
    }

    private function loadDatagrid()
    {
        // create datagrid
        $this->dgHotels = new BackendDataGridDB(BackendHotelsModel::QRY_DATAGRID_BROWSE_HOTELS);

        // set column URLs
        $this->dgHotels->setColumnURL(
            'title',
            BackendModel::createURLForAction('Edit') .
            '&amp;id=[id]'
        );

        // add edit column
        $this->dgHotels->addColumn(
            'edit',
            null,
            BL::lbl('Edit'),
            BackendModel::createURLForAction('Edit') .
            '&amp;id=[id]',
            BL::lbl('Edit')
        );
    }

    protected function parse()
    {
        parent::parse();
        $this->tpl->assign('dgHotels', (string) $this->dgHotels->getContent());
    }
}
