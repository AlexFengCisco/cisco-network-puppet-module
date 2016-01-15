# Manifest to demo cisco_interface provider
#
# Copyright (c) 2014-2015 Cisco and/or its affiliates.
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

class ciscopuppet::demo_stp {

  $domain = platform_get() ? {
    /(n5k|n6k|n7k)/ => 100,
    default => undef
  }

  $fcoe = platform_get() ? {
    /(n3k|n9k)/ => false,
    default => undef
  }

  cisco_stp_global { 'default':
    bpdufilter       => true,
    bpduguard        => true,
    bridge_assurance => false,
    domain           => $domain,
    fcoe             => $fcoe,
    loopguard        => true,
    mode             => 'mst',
    mst_forward_time => 25,
    mst_hello_time   => 5,
    mst_max_age      => 35,
    mst_max_hops     => 200,
    mst_name         => 'nexus',
    mst_revision     => 34,
    pathcost         => 'long',
  }
}
