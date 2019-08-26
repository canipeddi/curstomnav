$adminSiteURL="https://iscis-admin.sharepoint.com"

$cred = Get-Credential
Connect-PnPOnline -Url $adminSiteURL -Credentials $cred

$siteDesignId="0fd65266-8330-46e5-b3db-301c51af5b8a";
$newSite="https://iscis.sharepoint.com/sites/MyCompany817"

New-PnPSite -Type TeamSite -Title "My Company" -Alias MyCompany817

Connect-PnPOnline -Url $newSite -Credentials $cred

Invoke-PnPSiteDesign -Identity $siteDesignId

Install-PnPApp -Identity 11533865-bf60-444c-8b28-e8d5e81759a4 