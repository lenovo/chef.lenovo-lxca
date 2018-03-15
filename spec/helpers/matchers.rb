#------------------------------------------------------------
# Lenovo Copyright
#
# (c) Copyright Lenovo 2017.
#
# LIMITED AND RESTRICTED RIGHTS NOTICE:
# If data or software is delivered pursuant a General Services
# Administration (GSA) contract, use, reproduction, or disclosure
# is subject to restrictions set forth in Contract No. GS-35F-05925.
#-------------------------------------------------------------
# spec/helpers/matchers.rb

# def my_custom_matcher(resource_name)
#   ChefSpec::Matchers::ResourceMatcher.new(:resource_name, :action, resource_name)
# end

def discover_all_lxca_cabinet(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_cabinet', :discover_all, resource_name)
end

def filter_by_uuid_lxca_cabinet(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_cabinet', :filter_by_uuid, resource_name)
end

def discover_all_lxca_canister(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_canister', :discover_all, resource_name)
end

def filter_by_uuid_lxca_canister(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_canister', :filter_by_uuid, resource_name)
end

def discover_all_lxca_chassis(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_chassis', :discover_all, resource_name)
end

def discover_managed_lxca_chassis(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_chassis', :discover_managed, resource_name)
end

def discover_unmanaged_lxca_chassis(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_chassis', :discover_unmanaged, resource_name)
end

def filter_by_uuid_lxca_chassis(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_chassis', :filter_by_uuid, resource_name)
end

def discover_all_lxca_cmm(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_cmm', :discover_all, resource_name)
end

def filter_by_chassis_lxca_cmm(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_cmm', :filter_by_chassis, resource_name)
end

def filter_by_uuid_lxca_cmm(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_cmm', :filter_by_uuid, resource_name)
end

def discover_all_lxca_event(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_event', :discover_all, resource_name)
end

def discover_all_lxca_fan_muxes(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_fan_muxes', :discover_all, resource_name)
end

def filter_by_chassis_lxca_fan_muxes(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_fan_muxes', :filter_by_chassis, resource_name)
end

def filter_by_uuid_lxca_fan_muxes(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_fan_muxes', :filter_by_uuid, resource_name)
end

def discover_all_lxca_fan(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_fan', :discover_all, resource_name)
end

def filter_by_chassis_lxca_fan(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_fan', :filter_by_chassis, resource_name)
end

def filter_by_uuid_lxca_fan(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_fan', :filter_by_uuid, resource_name)
end

def filter_by_uuid_lxca_ffdc(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_ffdc', :filter_by_uuid, resource_name)
end

def discover_all_lxca_job(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_job', :discover_all, resource_name)
end

def filter_by_jobid_lxca_job(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_job', :filter_by_id, resource_name)
end

def filter_by_deviceid_lxca_job(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_job', :filter_by_uuid, resource_name)
end

def filter_by_state_lxca_job(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_job', :filter_by_state, resource_name)
end

def cancel_job_lxca_job(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_job', :cancel_job, resource_name)
end

def delete_job_lxca_job(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_job', :delete_job, resource_name)
end

def discover_all_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :discover_all, resource_name)
end

def discover_managed_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :discover_managed, resource_name)
end

def discover_unmanaged_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :discover_unmanaged, resource_name)
end

def filter_by_chassis_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :filter_by_chassis, resource_name)
end

def filter_by_uuid_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :filter_by_uuid, resource_name)
end

def power_on_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :power_on, resource_name)
end

def power_off_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :power_off, resource_name)
end

def power_restart_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :power_restart, resource_name)
end

def blink_led_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :blink_led, resource_name)
end

def turn_on_led_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :turn_on_led, resource_name)
end

def turn_off_led_lxca_node(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_node', :turn_off_led, resource_name)
end

def discover_all_lxca_power_supplies(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_power_supplies', :discover_all, resource_name)
end

def filter_by_chassis_lxca_power_supplies(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_power_supplies', :filter_by_chassis, resource_name)
end

def filter_by_uuid_lxca_power_supplies(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_power_supplies', :filter_by_uuid, resource_name)
end

def discover_all_lxca_scalable_complex(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_scalable_complex', :discover_all, resource_name)
end

def discover_managed_lxca_scalable_complex(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_scalable_complex', :discover_managed, resource_name)
end

def discover_unmanaged_lxca_scalable_complex(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_scalable_complex', :discover_unmanaged, resource_name)
end

def discover_flex_lxca_scalable_complex(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_scalable_complex', :discover_flex, resource_name)
end

def discover_rackserver_lxca_scalable_complex(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_scalable_complex', :discover_rackserver, resource_name)
end

def filter_by_uuid_lxca_scalable_complex(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_scalable_complex', :filter_by_uuid, resource_name)
end

def discover_all_lxca_switches(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_switches', :discover_all, resource_name)
end

def filter_by_chassis_lxca_switches(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_switches', :filter_by_chassis, resource_name)
end

def filter_by_uuid_lxca_switches(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_switches', :filter_by_uuid, resource_name)
end

def discover_all_lxca_users(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_users', :discover_all, resource_name)
end

def filter_by_id_lxca_users(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_users', :filter_by_id, resource_name)
end

def discover_all_lxca_config_pattern(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_pattern', :discover_all, resource_name)
end

def filter_by_id_lxca_config_pattern(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_pattern', :filter_by_id, resource_name)
end

def export_config_pattern_lxca_config_pattern(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_pattern', :export_config_pattern, resource_name)
end

def deploy_config_pattern_lxca_config_pattern(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_pattern', :deploy_config_pattern, resource_name)
end

def import_config_pattern_lxca_config_pattern(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_pattern', :import_config_pattern, resource_name)
end

def discover_all_lxca_config_profile(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_profile', :discover_all, resource_name)
end

def filter_by_id_lxca_config_profile(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_profile', :filter_by_id, resource_name)
end

def activate_config_profile_lxca_config_profile(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_profile', :activate_config_profile, resource_name)
end

def rename_config_profile_lxca_config_profile(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_profile', :rename_config_profile, resource_name)
end

def unassign_config_profile_lxca_config_profile(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_profile', :unassign_config_profile, resource_name)
end

def delete_config_profile_lxca_config_profile(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_profile', :delete_config_profile, resource_name)
end

def filter_by_id_lxca_config_target(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_config_target', :filter_by_id, resource_name)
end

def discover_devices_by_slp_lxca_discovery(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_discovery', :discover_devices_by_slp, resource_name)
end

def discover_manageable_devices_lxca_discover_request(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_discover_request', :discover_manageable_devices, resource_name)
end

def monitor_discover_request_lxca_discover_request(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_discover_request', :monitor_discover_request, resource_name)
end
 
def fetch_manage_request_lxca_manage_request(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_manage_request', :fetch_manage_request, resource_name)
end

def manage_discovered_devices_lxca_manage_request(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_manage_request', :manage_discovered_devices, resource_name)
end

def fetch_unmanage_request_lxca_unmanage_request(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_unmanage_request', :fetch_unmanage_request, resource_name)
end

def unmanage_discovered_devices_lxca_unmanage_request(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_unmanage_request', :unmanage_discovered_devices, resource_name)
end

def discover_firmware_update_status_lxca_update_comp(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_comp', :discover_firmware_update_status, resource_name)
end

def discover_updatable_device_comp_lxca_update_comp(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_comp', :discover_updatable_device_comp, resource_name)
end

def apply_firmware_update_lxca_update_comp(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_comp', :apply_firmware_update, resource_name)
end

def cancel_firmware_update_lxca_update_comp(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_comp', :cancel_firmware_update, resource_name)
end

def modify_power_state_lxca_update_comp(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_comp', :modify_power_state, resource_name)
end

def discover_update_policy_lxca_update_policy(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_policy', :discover_update_policy, resource_name)
end

def discover_application_firmware_lxca_update_policy(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_policy', :discover_application_firmware, resource_name)
end

def discover_persisted_compare_results_lxca_update_policy(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_policy', :discover_persisted_compare_results, resource_name)
end

def discover_compare_results_lxca_update_policy(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_policy', :discover_compare_results, resource_name)
end

def assign_compliance_policy_lxca_update_policy(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_policy', :assign_compliance_policy, resource_name)
end

def delete_compliance_policy_lxca_update_policy(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_policy', :delete_compliance_policy, resource_name)
end

def discover_update_repo_lxca_update_repo(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_repo', :discover_update_repo, resource_name)
end

def read_update_repo_lxca_update_repo(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_repo', :read_update_repo, resource_name)
end

def refresh_update_repo_lxca_update_repo(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_repo', :refresh_update_repo, resource_name)
end

def acquire_firmware_updates_lxca_update_repo(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_repo', :acquire_firmware_updates, resource_name)
end

def delete_firmware_updates_lxca_update_repo(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_repo', :delete_firmware_updates, resource_name)
end

def export_firmware_updates_lxca_update_repo(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new('lxca_update_repo', :export_firmware_updates, resource_name)
end

