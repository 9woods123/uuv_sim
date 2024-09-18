/*
 * Copyright (C) 2012 Open Source Robotics Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
*/
#include "selection_buffer/SelectionRenderListener.hh"
#include "selection_buffer/MaterialSwitcher.hh"

using namespace gazebo;
using namespace rendering;

/////////////////////////////////////////////////
SelectionRenderListener::SelectionRenderListener(MaterialSwitcher *_switcher)
  : materialListener(_switcher)
{
}

/////////////////////////////////////////////////
SelectionRenderListener::~SelectionRenderListener()
{
}

/////////////////////////////////////////////////
void SelectionRenderListener::preRenderTargetUpdate(
    const Ogre::RenderTargetEvent &/*_evt*/)
{
  Ogre::MaterialManager::getSingleton().addListener(this->materialListener);
}

/////////////////////////////////////////////////
void SelectionRenderListener::postRenderTargetUpdate(
    const Ogre::RenderTargetEvent &/*_evt*/)
{
  Ogre::MaterialManager::getSingleton().removeListener(this->materialListener);
}
