#!/bin/bash
# Copyright (c) 2016 The UUV Simulator Authors.
# All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

sh .uuv_ci_config/install_gazebo7.sh

xargs -a .uuv_ci_config/ros_indigo_dependencies.txt apt -qq install --no-install-recommends --allow-unauthenticated -y

source /usr/share/gazebo-7/setup.sh

sh .uuv_ci_config/uuv_dependencies.sh
