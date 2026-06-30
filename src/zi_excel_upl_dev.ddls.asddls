@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: 'User Development'

define view entity ZI_EXCEL_UPL_DEV
  as select from ZEXCEL_UPL_DEV

association to parent ZI_EXCEL_UPL as _User
on  $projection.EmpId = _User.EmpId
and $projection.DevId = _User.DevId

{

  key emp_id        as EmpId,
  key dev_id        as DevId,
  key serial_no     as SerialNo,

      object_type   as ObjectType,
      object_name   as ObjectName,

      _User
}
