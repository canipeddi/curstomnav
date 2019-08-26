$themePallete=@{
"themePrimary" = "#d40078";
"themeLighterAlt" = "#fdf3f9";
"themeLighter" = "#f8d0e7";
"themeLight" = "#f2a9d3";
"themeTertiary" = "#e55ca9";
"themeSecondary" = "#d91a86";
"themeDarkAlt" = "#be006c";
"themeDark" = "#a1005b";
"themeDarker" = "#770043";
"neutralLighterAlt" = "#f8f8f8";
"neutralLighter" = "#f4f4f4";
"neutralLight" = "#eaeaea";
"neutralQuaternaryAlt" = "#dadada";
"neutralQuaternary" = "#d0d0d0";
"neutralTertiaryAlt" = "#c8c8c8";
"neutralTertiary" = "#d4a5a5";
"neutralSecondary" = "#a95e5e";
"neutralPrimaryAlt" = "#812d2d";
"neutralPrimary" = "#6f1d1d";
"neutralDark" = "#551616";
"black" = "#3f1010";
"white" = "#ffffff";
}


$adminSiteURL="https://sptechtime-admin.sharepoint.com/"
$cred = Get-Credential
Connect-PnPOnline -Url $adminSiteURL -Credentials $cred

#Add-PnPTenantTheme -Identity "BarclaysTheme2" -Palette $themePallete -IsInverted $false

$raw = Get-Content -Path "C:\o365\MySiteProvisioning\SPProvision.json" -Raw
write-host $raw

$siteScriptId=Add-PnPSiteScript -Title "BarclaysScript3" -Content $raw
write-host $siteScriptId.Id

$siteDesign=Add-PnPSiteDesign -Title "BarclaysCustomDesign3" -SiteScriptIds $siteScriptId.Id -WebTemplate TeamSite 
write-host $siteDesign.Id 

