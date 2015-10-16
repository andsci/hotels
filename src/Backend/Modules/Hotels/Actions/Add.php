<?php

namespace Backend\Modules\Hotels\Actions;

use Symfony\Component\Filesystem\Filesystem;

use Backend\Core\Engine\Base\ActionAdd as BackendBaseActionAdd;
use Backend\Modules\Hotels\Engine\Model as BackendHotelsModel;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\Language as BL;

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
        $this->frm = new BackendForm('add');
        $this->frm->addText('title', null, null, 'inputText title', 'inputTextError title');
        $this->frm->addText('country');
        $this->frm->addText('city');
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
                $item['country'] = $fields['country']->getValue();
                $item['city'] = $fields['city']->getValue();
                $item['image'] = null;

                if($fields['image']->isFilled())
                {
                    // the image path
                    $imagePath = FRONTEND_FILES_PATH . '/hotels/images';

                    // create folders if needed
                    $fs = new Filesystem();
                    $fs->mkdir(array($imagePath . '/source', $imagePath . '/128x128'));

                    $item['image'] = $fields['image']->getFileName(false).'.'.$fields['image']->getExtension();
                    $i = 2;
                    while($fs->exists($imagePath . '/source/'.$item['image'])){
                        $item['image'] = $fields['image']->getFileName(false) . '(' . $i . ')' . '.' . $fields['image']->getExtension();
                        $i++;
                    }

                    // upload the image & generate thumbnails
                    $fields['image']->generateThumbnails($imagePath, $item['image']);
                }

                $item['id'] = BackendHotelsModel::insertRecord('hotels', $item);

                $this->redirect(BackendModel::createURLForAction('Index') . '&report=added&var=' . urlencode($item['title']) . '&highlight=row-' . $item['id']);
            }
        }
    }

    protected function parse()
    {
        parent::parse();
    }
}
