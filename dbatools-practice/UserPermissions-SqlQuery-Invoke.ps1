$SqlQuery = @"
SELECT 
    dp.name AS UserName,
    dp.type_desc AS PrincipalType,
    o.name AS ObjectName,
    o.type_desc AS ObjectType,
    p.class_desc AS PermissionClass,
    p.permission_name AS PermissionName,
    p.state_desc AS PermissionState
FROM 
    sys.database_permissions p
LEFT JOIN 
    sys.objects o ON p.major_id = o.object_id
INNER JOIN 
    sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
WHERE 
    dp.type IN ('S', 'U', 'G') -- S: SQL user, U: Windows user, G: Windows group
ORDER BY 
    dp.name, o.name, p.permission_name;

"@

$advWorksConnection = Connect-DbaInstance -SqlInstance 'ESPEED4\SQLEXPRESS' -Database 'AdventureWorks' -TrustServerCertificate

Invoke-DbaQuery -SqlInstance $advWorksConnection -Query $SqlQuery | ft -AutoSize
