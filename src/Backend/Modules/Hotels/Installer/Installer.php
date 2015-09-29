<?php

namespace Backend\Modules\Hotels\Installer;

use Backend\Core\Installer\ModuleInstaller;

class Installer extends ModuleInstaller
{
    public function install()
    {

        // add 'hotels' as a module
        $this->addModule('Hotels');

        // module rights
        $this->setModuleRights(1, 'Hotels');

        // action rights
        $this->setActionRights(1, 'Hotels', 'Add');
        $this->setActionRights(1, 'Hotels', 'Edit');
        $this->setActionRights(1, 'Hotels', 'Delete');
        $this->setActionRights(1, 'Hotels', 'RoomAdd');
        $this->setActionRights(1, 'Hotels', 'RoomEdit');
        $this->setActionRights(1, 'Hotels', 'RoomDelete');

        // set navigation
        $navigationModulesId = $this->setNavigation(null, 'Modules');
        $navigationHotelsId = $this->setNavigation($navigationModulesId, 'Hotels');
        $this->setNavigation(
            $navigationHotelsId,
            'Hotels',
            'hotels/index',
            array('hotels/add', 'hotels/edit', 'hotels/room_add', 'hotels/room_edit')
        );
    }
}
