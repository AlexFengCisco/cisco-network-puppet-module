# Manifest to demo base profile 
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

class ciscopuppet::demo_profile::base {
  include ciscopuppet::install
  include ciscopuppet::demo_repo
  # To apply the demo_cisco_patch_rpm manifest, uncomment the
  # following line and modify the demo_cisco_patch_rpm.pp
  # as instructed in the header. 
  #include ciscopuppet::demo_cisco_patch_rpm
}
