#Config Variables
$SiteURL = "https://sptechtime.sharepoint.com/sites/MattSandboxTeamSite"
 
#Get Credentials to connect
$Cred = Get-Credential
 
Try {
    #Connect to PNP Online
    Connect-PnPOnline -Url $SiteURL -Credentials $Cred
     
    #Add a Link to Top Navigation Bar
    Add-PnPNavigationNode -Title "Support Center" -Url "https://sptechtime.sharepoint.com/sites/MattSandboxTeamSite" -Location TopNavigationBar
 
    #Get the Navigation node "Support Center"
    $ParentID = Get-PnPNavigationNode -Location TopNavigationBar | Where {$_.Title -eq "Support Center"}  | Select -ExpandProperty ID
    #Add a link under "Support Center
    Add-PnPNavigationNode -Title "Application Support" -Url "https://sptechtime.sharepoint.com/sites/MattSandboxTeamSite" -Location TopNavigationBar -Parent $ParentID
  
    Write-host "Quick Launch Links Added Successfully!" -f Green
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}