<?php

namespace Backend\Modules\Hotels\Actions;

use Symfony\Component\Filesystem\Filesystem;

use Backend\Core\Engine\Base\ActionAdd as BackendBaseActionAdd;
use Backend\Modules\Hotels\Engine\Model as BackendHotelsModel;
use Backend\Core\Engine\Form as BackendForm;

class Add extends BackendBaseActionAdd
{
    public function execute()
    {
        parent::execute();
        $this->loadForm();
        $this->validateForm();
        $this->parse();
        $this->display();
    }

    private function loadForm()
    {
        $this->frm = new BackendForm();
        $this->frm->addText('title', null, null, 'inputText title', 'inputTextError title');
        $this->frm->addImage('image');
    }

    private function validateForm()
    {
        if ($this->frm->isSubmitted()) {

            $fields = $this->frm->getFields();

            $fields['title']->isFilled(BL::err('TitleIsRequired'));

            if ($this->frm->isCorrect()) {
                $item = [];
                $item['title'] = $fields['title']->getValue();


                $this->redirect(BackendModel::createURLForAction('Index') . '&report=added&var=' . urlencode($item['title']) . '&highlight=row-' . $item['id']);
            }
        }
    }

    protected function parse()
    {
        parent::parse();
    }
}
