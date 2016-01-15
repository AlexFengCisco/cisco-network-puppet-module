# Manifest to demo cisco_vpc_domain provider
#
# Copyright (c) 2014-2016 Cisco and/or its affiliates.
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

class ciscopuppet::demo_vpc_domain {

  $layer3_peer_routing = platform_get() ? {
    /(n6k|n7k)/      => true,
    default          => undef
  }

  $peer_gateway_exclude_vlan = platform_get() ? {
    /(n6k|n7k)/      => '500-1000, 1100, 1120',
    default          => undef
  }

  $self_isolation = platform_get() ? {
    'n7k'            => false,
    default          => undef
  }

  cisco_vpc_domain { '100' :
    ensure                                             => present,
    auto_recovery                                      => $auto_recovery,
    auto_recovery_reload_delay                         => 300,
    delay_restore                                      => 250,
    delay_restore_interface_vlan                       => 300,
    dual_active_exclude_interface_vlan_bridge_domain   => '10-30, 500',
    graceful_consistency_check                         => true,
    layer3_peer_routing                                => $layer3_peer_routing,
    peer_gateway                                       => true,
    peer_gateway_exclude_vlan                          => $peer_gateway_exclude_vlan,
    role_priority                                      => 32000,
    self_isolation                                     => $self_isolation,
    shutdown                                           => false,
    system_mac                                         => "00:0c:0d:11:22:33",
    system_priority                                    => 32000,
  }
}
