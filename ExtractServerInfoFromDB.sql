CREATE DATABASE SqlDeepReport
GO
USE [SqlDeepReport]
GO
CREATE TABLE [FileContent] (
    [Id] int identity PRIMARY KEY,
    [FileName] nvarchar(255),
    [Content] nvarchar(4000),
    [XMLContent] AS (CAST (CONCAT('<Data>',[Content],'</Data>') AS XML))
)

Use [SqlDeepReport]
GO

select
    [myQuery].Instance.query('InstanceName').value('.','nvarchar(255)') AS InstanceName,
    [myQuery].Instance.query('InstanceVersion').value('.','nvarchar(255)') AS InstanceVersion,
    [myQuery].Instance.query('Collation').value('.','nvarchar(255)') AS Collation
from 
    dbo.FileContent as myContent
    CROSS APPLY [myContent].[XMLContent].nodes('Data/instance') as myQuery(Instance);
-------------------
select
    [myQuery].Config.query('InstanceName').value('.','nvarchar(255)') AS InstanceName,
    [myQuery].Config.query('name').value('.','nvarchar(255)') AS databasename,
    [myQuery].Config.query('database_id').value('.','int') AS database_id,
    [myQuery].Config.query('owner_sid').value('.','nvarchar(255)') AS owner_sid,
    [myQuery].Config.query('create_date').value('.','nvarchar(255)') AS create_date,
    [myQuery].Config.query('compatibility_level').value('.','int') AS compatibility_level,
    [myQuery].Config.query('collation_name').value('.','nvarchar(255)') AS collation_name,
    [myQuery].Config.query('user_access').value('.','nvarchar(255)') AS user_access,
    [myQuery].Config.query('user_access_desc').value('.','nvarchar(255)') AS user_access_desc,
    [myQuery].Config.query('is_read_only').value('.','nvarchar(255)') AS is_read_only,
    [myQuery].Config.query('is_auto_close_on').value('.','nvarchar(255)') AS is_auto_close_on,
    [myQuery].Config.query('is_auto_shrink_on').value('.','nvarchar(255)') AS is_auto_shrink_on,
    [myQuery].Config.query('state').value('.','nvarchar(255)') AS state,
    [myQuery].Config.query('state_desc').value('.','nvarchar(255)') AS state_desc,
    [myQuery].Config.query('is_in_standby').value('.','nvarchar(255)') AS is_in_standby,
    [myQuery].Config.query('is_cleanly_shutdown').value('.','nvarchar(255)') AS is_cleanly_shutdown,
    [myQuery].Config.query('is_supplemental_logging_enabled').value('.','nvarchar(255)') AS is_supplemental_logging_enabled,
    [myQuery].Config.query('snapshot_isolation_state').value('.','nvarchar(255)') AS snapshot_isolation_state,
    [myQuery].Config.query('snapshot_isolation_state_desc').value('.','nvarchar(255)') AS snapshot_isolation_state_desc,
    [myQuery].Config.query('is_read_committed_snapshot_on').value('.','nvarchar(255)') AS is_read_committed_snapshot_on,
    [myQuery].Config.query('recovery_model').value('.','nvarchar(255)') AS recovery_model,
    [myQuery].Config.query('recovery_model_desc').value('.','nvarchar(255)') AS recovery_model_desc,
    [myQuery].Config.query('page_verify_option').value('.','nvarchar(255)') AS page_verify_option,
    [myQuery].Config.query('page_verify_option_desc').value('.','nvarchar(255)') AS page_verify_option_desc,
    [myQuery].Config.query('is_auto_create_stats_on').value('.','nvarchar(255)') AS is_auto_create_stats_on,
    [myQuery].Config.query('is_auto_create_stats_incremental_on').value('.','nvarchar(255)') AS is_auto_create_stats_incremental_on,
    [myQuery].Config.query('is_auto_update_stats_on').value('.','nvarchar(255)') AS is_auto_update_stats_on,
    [myQuery].Config.query('is_auto_update_stats_async_on').value('.','nvarchar(255)') AS is_auto_update_stats_async_on,
    [myQuery].Config.query('is_ansi_null_default_on').value('.','nvarchar(255)') AS is_ansi_null_default_on,
    [myQuery].Config.query('is_ansi_nulls_on').value('.','nvarchar(255)') AS is_ansi_nulls_on,
    [myQuery].Config.query('is_ansi_padding_on').value('.','nvarchar(255)') AS is_ansi_padding_on,
    [myQuery].Config.query('is_ansi_warnings_on').value('.','nvarchar(255)') AS is_ansi_warnings_on,
    [myQuery].Config.query('is_arithabort_on').value('.','nvarchar(255)') AS is_arithabort_on,
    [myQuery].Config.query('is_concat_null_yields_null_on').value('.','nvarchar(255)') AS is_concat_null_yields_null_on,
    [myQuery].Config.query('is_numeric_roundabort_on').value('.','nvarchar(255)') AS is_numeric_roundabort_on,
    [myQuery].Config.query('is_quoted_identifier_on').value('.','nvarchar(255)') AS is_quoted_identifier_on,
    [myQuery].Config.query('is_recursive_triggers_on').value('.','nvarchar(255)') AS is_recursive_triggers_on,
    [myQuery].Config.query('is_cursor_close_on_commit_on').value('.','nvarchar(255)') AS is_cursor_close_on_commit_on,
    [myQuery].Config.query('is_local_cursor_default').value('.','nvarchar(255)') AS is_local_cursor_default,
    [myQuery].Config.query('is_fulltext_enabled').value('.','nvarchar(255)') AS is_fulltext_enabled,
    [myQuery].Config.query('is_trustworthy_on').value('.','nvarchar(255)') AS is_trustworthy_on,
    [myQuery].Config.query('is_db_chaining_on').value('.','nvarchar(255)') AS is_db_chaining_on,
    [myQuery].Config.query('is_parameterization_forced').value('.','nvarchar(255)') AS is_parameterization_forced,
    [myQuery].Config.query('is_master_key_encrypted_by_server').value('.','nvarchar(255)') AS is_master_key_encrypted_by_server,
    [myQuery].Config.query('is_query_store_on').value('.','nvarchar(255)') AS is_query_store_on,
    [myQuery].Config.query('is_published').value('.','nvarchar(255)') AS is_published,
    [myQuery].Config.query('is_subscribed').value('.','nvarchar(255)') AS is_subscribed,
    [myQuery].Config.query('is_merge_published').value('.','nvarchar(255)') AS is_merge_published,
    [myQuery].Config.query('is_distributor').value('.','nvarchar(255)') AS is_distributor,
    [myQuery].Config.query('is_sync_with_backup').value('.','nvarchar(255)') AS is_sync_with_backup,
    [myQuery].Config.query('service_broker_guid').value('.','nvarchar(255)') AS service_broker_guid,
    [myQuery].Config.query('is_broker_enabled').value('.','nvarchar(255)') AS is_broker_enabled,
    [myQuery].Config.query('log_reuse_wait').value('.','nvarchar(255)') AS log_reuse_wait,
    [myQuery].Config.query('log_reuse_wait_desc').value('.','nvarchar(255)') AS log_reuse_wait_desc,
    [myQuery].Config.query('is_date_correlation_on').value('.','nvarchar(255)') AS is_date_correlation_on,
    [myQuery].Config.query('is_cdc_enabled').value('.','nvarchar(255)') AS is_cdc_enabled,
    [myQuery].Config.query('is_encrypted').value('.','nvarchar(255)') AS is_encrypted,
    [myQuery].Config.query('is_honor_broker_priority_on').value('.','nvarchar(255)') AS is_honor_broker_priority_on,
    [myQuery].Config.query('containment').value('.','nvarchar(255)') AS containment,
    [myQuery].Config.query('containment_desc').value('.','nvarchar(255)') AS containment_desc,
    [myQuery].Config.query('target_recovery_time_in_seconds').value('.','nvarchar(255)') AS target_recovery_time_in_seconds,
    [myQuery].Config.query('delayed_durability').value('.','nvarchar(255)') AS delayed_durability,
    [myQuery].Config.query('delayed_durability_desc').value('.','nvarchar(255)') AS delayed_durability_desc,
    [myQuery].Config.query('is_memory_optimized_elevate_to_snapshot_on').value('.','nvarchar(255)') AS is_memory_optimized_elevate_to_snapshot_on,
    [myQuery].Config.query('is_federation_member').value('.','nvarchar(255)') AS is_federation_member,
    [myQuery].Config.query('is_remote_data_archive_enabled').value('.','nvarchar(255)') AS is_remote_data_archive_enabled,
    [myQuery].Config.query('is_mixed_page_allocation_on').value('.','nvarchar(255)') AS is_mixed_page_allocation_on,
    [myQuery].Config.query('is_temporal_history_retention_enabled').value('.','nvarchar(255)') AS is_temporal_history_retention_enabled,
    [myQuery].Config.query('catalog_collation_type').value('.','nvarchar(255)') AS catalog_collation_type,
    [myQuery].Config.query('catalog_collation_type_desc').value('.','nvarchar(255)') AS catalog_collation_type_desc,
    [myQuery].Config.query('physical_database_name').value('.','nvarchar(255)') AS physical_database_name,
    [myQuery].Config.query('is_result_set_caching_on').value('.','nvarchar(255)') AS is_result_set_caching_on,
    [myQuery].Config.query('is_accelerated_database_recovery_on').value('.','nvarchar(255)') AS is_accelerated_database_recovery_on,
    [myQuery].Config.query('is_tempdb_spill_to_remote_store').value('.','nvarchar(255)') AS is_tempdb_spill_to_remote_store,
    [myQuery].Config.query('is_stale_page_detection_on').value('.','nvarchar(255)') AS is_stale_page_detection_on,
    [myQuery].Config.query('is_memory_optimized_enabled').value('.','nvarchar(255)') AS is_memory_optimized_enabled
from 
    dbo.FileContent as myContent
    CROSS APPLY [myContent].[XMLContent].nodes('Data/config') as myQuery(Config)
-------------------
select
    [myQuery].Files.query('InstanceName').value('.','nvarchar(255)') AS InstanceName,
    [myQuery].Files.query('DatabaseName').value('.','nvarchar(255)') AS DatabaseName,
    [myQuery].Files.query('database_id').value('.','int') AS database_id,
    [myQuery].Files.query('file_id').value('.','int') AS file_id,
    [myQuery].Files.query('file_guid').value('.','nvarchar(255)') AS file_guid,
    [myQuery].Files.query('type').value('.','nvarchar(255)') AS type,
    [myQuery].Files.query('type_desc').value('.','nvarchar(255)') AS type_desc,
    [myQuery].Files.query('data_space_id').value('.','nvarchar(255)') AS data_space_id,
    [myQuery].Files.query('name').value('.','nvarchar(255)') AS name,
    [myQuery].Files.query('physical_name').value('.','nvarchar(255)') AS physical_name,
    [myQuery].Files.query('state').value('.','nvarchar(255)') AS state,
    [myQuery].Files.query('state_desc').value('.','nvarchar(255)') AS state_desc,
    [myQuery].Files.query('size').value('.','bigint') AS size,
    [myQuery].Files.query('max_size').value('.','bigint') AS max_size,
    [myQuery].Files.query('growth').value('.','bigint') AS growth,
    [myQuery].Files.query('is_media_read_only').value('.','nvarchar(255)') AS is_media_read_only,
    [myQuery].Files.query('is_read_only').value('.','nvarchar(255)') AS is_read_only,
    [myQuery].Files.query('is_sparse').value('.','nvarchar(255)') AS is_sparse,
    [myQuery].Files.query('is_percent_growth').value('.','nvarchar(255)') AS is_percent_growth,
    [myQuery].Files.query('is_name_reserved').value('.','nvarchar(255)') AS is_name_reserved,
    [myQuery].Files.query('is_persistent_log_buffer').value('.','nvarchar(255)') AS is_persistent_log_buffer
from 
    dbo.FileContent as myContent
    CROSS APPLY [myContent].[XMLContent].nodes('Data/file') as myQuery(Files);
-------------------
select
    [myQuery].Job.query('InstanceName').value('.','nvarchar(255)') AS InstanceName,
    [myQuery].Job.query('job_id').value('.','nvarchar(255)') AS job_id,
    [myQuery].Job.query('originating_server_id').value('.','int') AS originating_server_id,
    [myQuery].Job.query('name').value('.','nvarchar(255)') AS name,
    [myQuery].Job.query('enabled').value('.','nvarchar(255)') AS enabled,
    [myQuery].Job.query('description').value('.','nvarchar(255)') AS description,
    [myQuery].Job.query('start_step_id').value('.','nvarchar(255)') AS start_step_id,
    [myQuery].Job.query('category_id').value('.','nvarchar(255)') AS category_id,
    [myQuery].Job.query('owner_sid').value('.','nvarchar(255)') AS owner_sid,
    [myQuery].Job.query('notify_level_eventlog').value('.','nvarchar(255)') AS notify_level_eventlog,
    [myQuery].Job.query('notify_level_email').value('.','nvarchar(255)') AS notify_level_email,
    [myQuery].Job.query('notify_level_netsend').value('.','nvarchar(255)') AS notify_level_netsend,
    [myQuery].Job.query('notify_level_page').value('.','nvarchar(255)') AS notify_level_page,
    [myQuery].Job.query('notify_email_operator_id').value('.','nvarchar(255)') AS notify_email_operator_id,
    [myQuery].Job.query('notify_netsend_operator_id').value('.','nvarchar(255)') AS notify_netsend_operator_id,
    [myQuery].Job.query('notify_page_operator_id').value('.','nvarchar(255)') AS notify_page_operator_id,
    [myQuery].Job.query('delete_level').value('.','nvarchar(255)') AS delete_level,
    [myQuery].Job.query('date_created').value('.','nvarchar(255)') AS date_created,
    [myQuery].Job.query('date_modified').value('.','nvarchar(255)') AS date_modified,
    [myQuery].Job.query('version_number').value('.','nvarchar(255)') AS version_number
from 
    dbo.FileContent as myContent
    CROSS APPLY [myContent].[XMLContent].nodes('Data/job') as myQuery(Job);
-------------------
select
    [myQuery].Logins.query('InstanceName').value('.','nvarchar(255)') AS InstanceName,
    [myQuery].Logins.query('LoginCount').value('.','int') AS LoginCount
from 
    dbo.FileContent as myContent
    CROSS APPLY [myContent].[XMLContent].nodes('Data/login') as myQuery(Logins);