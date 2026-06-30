@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Excel Upload Child Consumption'
@Metadata.allowExtensions: true

define view entity ZC_EXCEL_UPL_DEV
  as projection on ZI_EXCEL_UPL_DEV
{

  key EmpId,
  key DevId,
  key SerialNo,

      ObjectType,
      ObjectName,

      _User : redirected to parent ZC_EXCEL_UPL

}
