@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'User Details'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZI_EXCEL_UPL
  as select from zexcel_upload
    composition [0..*] of ZI_EXCEL_UPL_DEV as _UserDev
{

  key emp_id              as EmpId,
  key dev_id              as DevId,

     dev_description     as DevDescription,

      @Semantics.largeObject: {
        mimeType: 'MimeType',
        fileName: 'FileName',
        contentDispositionPreference: #ATTACHMENT
      }
      attachment          as Attachment,

      @Semantics.mimeType: true
      mimetype            as MimeType,

      filename            as FileName,
      file_status         as FileStatus,
      template_status     as TemplateStatus,

      
      case file_status
        when 'File Selected' then 2
        when 'Excel Uploaded' then 3
        when 'File not Selected' then 1
        else 0
      end                 as Criticality,

      case template_status
        when 'Present' then 3
        when 'Absent' then 1
        else 0
      end                 as TemplateCriticality,

      @Semantics.user.createdBy: true
      local_created_by       as LocalCreatedBy,

      @Semantics.systemDateTime.createdAt: true
      local_created_at       as LocalCreatedAt,

      @Semantics.user.lastChangedBy: true
      local_last_changed_by  as LocalLastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at  as LocalLastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at        as LastChangedAt,

      _UserDev
}
