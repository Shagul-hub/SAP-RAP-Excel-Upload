@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Excel Upload Consumption'
@Metadata.allowExtensions: true

define root view entity ZC_EXCEL_UPL
  provider contract transactional_query
  as projection on ZI_EXCEL_UPL
{
    key EmpId,
    key DevId,

    DevDescription,

    Attachment,
    MimeType,
    FileName,

    FileStatus,
    TemplateStatus,

    Criticality,
    TemplateCriticality,

    LocalCreatedBy,
    LocalCreatedAt,

    LocalLastChangedBy,
    LocalLastChangedAt,

    LastChangedAt,

    _UserDev : redirected to composition child ZC_EXCEL_UPL_DEV
}
