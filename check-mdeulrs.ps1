# Add your explicit web proxy if you have one, in format "http://<proxyFQDN>:<proxyPort>"
$Proxy = $null
$Outputdate = get-date -Format "yyyyy-MM-dd_HHmmss"
$ComputerName = $env:COMPUTERNAME
$MDEEndpoints = @(
    "https://winatp-gw-cus.microsoft.com/test",`
    "https://winatp-gw-eus.microsoft.com/test",`
    "https://winatp-gw-weu.microsoft.com/test",`
    "https://winatp-gw-neu.microsoft.com/test",`
    "https://winatp-gw-uks.microsoft.com/test",`
    "https://winatp-gw-ukw.microsoft.com/test",`
    "https://winatp-gw-usgv.microsoft.com/test",`
    "https://winatp-gw-usgt.microsoft.com/test",`
    "https://eu.vortex-win.data.microsoft.com/ping",`
    "https://us.vortex-win.data.microsoft.com/ping",`
    "https://uk.vortex-win.data.microsoft.com/ping",`
    "https://events.data.microsoft.com/ping",`
    "https://settings-win.data.microsoft.com/qos",`
    "https://eu-v20.events.data.microsoft.com/ping",`
    "https://uk-v20.events.data.microsoft.com/ping",`
    "https://us-v20.events.data.microsoft.com/ping",`
    "https://us4-v20.events.data.microsoft.com/ping",`
    "https://us5-v20.events.data.microsoft.com/ping"
    "https://11.dl.delivery.mp.microsoft.com",`
    "https://11.tlu.dl.delivery.mp.microsoft.com",`
    "https://1d.tlu.dl.delivery.mp.microsoft.com",`
    "https://2.dl.delivery.mp.microsoft.com",`
    "https://2.tlu.dl.delivery.mp.microsoft.com",`
    "https://3.dl.delivery.mp.microsoft.com",`
    "https://3.tlu.dl.delivery.mp.microsoft.com",`
    "https://4.dl.delivery.mp.microsoft.com",`
    "https://4.tlu.dl.delivery.mp.microsoft.com",`
    "https://7.dl.delivery.mp.microsoft.com",`
    "https://7.tlu.dl.delivery.mp.microsoft.com",`
    "https://9.dl.delivery.mp.microsoft.com",`
    "https://9.tlu.dl.delivery.mp.microsoft.com",`
    "https://api.security.microsoft.com",`
    "https://apprep.smartscreen.microsoft.com",`
    "https://ars.smartscreen.microsoft.com",`
    "https://automatedirstrprdcus.blob.core.windows.net",`
    "https://automatedirstrprdcus3.blob.core.windows.net",`
    "https://automatedirstrprdeus.blob.core.windows.net",`
    "https://automatedirstrprdeus3.blob.core.windows.net",`
    "https://automatedirstrprdneu.blob.core.windows.net",`
    "https://automatedirstrprdneu3.blob.core.windows.net",`
    "https://automatedirstrprduks.blob.core.windows.net",`
    "https://automatedirstrprdukw.blob.core.windows.net",`
    "https://automatedirstrprdweu.blob.core.windows.net",`
    "https://automatedirstrprdweu3.blob.core.windows.net",`
    "https://c.urs.microsoft.com",`
    "https://cdn.x.cp.wd.microsoft.com",`
    "https://client.wns.windows.com",`
    "https://data-edge.smartscreen.microsoft.com",`
    "https://definitionupdates.microsoft.com",`
    "https://df.security.microsoft.com",`
    "https://dl-edge.smartscreen.microsoft.com",`
    "https://dl.delivery.mp.microsoft.com",`
    "https://enterpriseregistration.windows.net",`
    "https://europe.x.cp.wd.microsoft.com",`
    "https://europe.cp.wd.microsoft.com",`
    "https://fe3.delivery.mp.microsoft.com",`
    "https://fe3cr.delivery.mp.microsoft.com",`
    "https://fe6cr.delivery.mp.microsoft.com",`
    "https://feedback.smartscreen.microsoft.com",`
    "https://go.microsoft.com",`
    "https://login.live.com",`
    "https://login.microsoftonline.com",`
    "https://login.windows.net",`
    "https://msedge.b.tlu.dl.delivery.mp.microsoft.com",`
    "https://msedge.f.dl.delivery.mp.microsoft.com",`
    "https://msedge.f.tlu.dl.delivery.mp.microsoft.com",`
    "https://msedge.sf.dl.delivery.mp.microsoft.com",`
    "https://msedgeextensions.sb.tlu.dl.delivery.mp.microsoft.com",`
    "https://msedgeextensions.sf.tlu.dl.delivery.mp.microsoft.com",`
    "https://nav-edge.smartscreen.microsoft.com",`
    "https://nav.smartscreen.microsoft.com",`
    "https://officecdn-microsoft-com.akamaized.net",`
    "https://packages.microsoft.com",`
    "https://ping-edge.smartscreen.microsoft.com",`
    "https://ping-signals.urs.microsoft.com",`
    "https://sip.security.microsoft.com",`
    "https://skydrive.wns.windows.com",`
    "https://t.urs.microsoft.com",`
    "https://tlu.dl.delivery.mp.microsoft.com",`
    "https://uk.vortex-win.data.microsoft.com",`
    "https://unitedkingdom.x.cp.wd.microsoft.com",`
    "https://unitedstates-api.fp.wd.microsoft.com",`
    "https://unitedstates.cp.wd.microsoft.com",`
    "https://unitedstates.smartscreen-prod.microsoft.com",`
    "https://unitedstates.smartscreen.microsoft.com",`
    "https://unitedstates.x.cp.wd.microsoft.com",`
    "https://usseu1northprod.blob.core.windows.net",`
    "https://usseu1westprod.blob.core.windows.net",`
    "https://ussuk1southprod.blob.core.windows.net",`
    "https://ussuk1westprod.blob.core.windows.net",`
    "https://ussus1eastprod.blob.core.windows.net",`
    "https://ussus1westprod.blob.core.windows.net",`
    "https://ussus2eastprod.blob.core.windows.net",`
    "https://ussus2westprod.blob.core.windows.net",`
    "https://ussus3eastprod.blob.core.windows.net",`
    "https://ussus3westprod.blob.core.windows.net",`
    "https://ussus4eastprod.blob.core.windows.net",`
    "https://ussus4westprod.blob.core.windows.net",`
    "https://vortex-win.data.microsoft.com",`
    "https://wns2-bl2p.wns.windows.com",`
    "https://wseu1northprod.blob.core.windows.net",`
    "https://wseu1westprod.blob.core.windows.net",`
    "https://wsuk1southprod.blob.core.windows.net",`
    "https://wsuk1westprod.blob.core.windows.net",`
    "https://wsus1eastprod.blob.core.windows.net",`
    "https://wsus1westprod.blob.core.windows.net",`
    "https://wsus2eastprod.blob.core.windows.net",`
    "https://wsus2westprod.blob.core.windows.net",`
    "https://x.cp.wd.microsoft.com"

)
function Get-MicrosoftSecureCertInfoHttp {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$URL,
        [Parameter(Position = 1)]
        [string]$Proxy
    )
    $CoreURL = ($URL -replace "http[s]{0,1}://(.+?)",'$1' -split "/")[0]
    try {
        [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $webRequest = [System.Net.HttpWebRequest]::Create($URL)
        if ($Proxy) {
            $webRequest.Proxy = [System.Net.WebProxy]::new($Proxy)
        }
        $webRequest.KeepAlive = $false
        $webRequest.Timeout = 5000
        $webRequest.ServicePoint.ConnectionLeaseTimeout = 5000
        $webRequest.ServicePoint.MaxIdleTime = 5000
        $webRequest.AllowAutoRedirect = $false
        $null = $webRequest.GetResponse().Dispose()
        
    }
    catch [System.Net.WebException] {
        if (($_.Exception.Status -eq [System.Net.WebExceptionStatus]::TrustFailure) -or ($_.Exception.Status -eq [System.Net.WebExceptionStatus]::ProtocolError)) {
            # We ignore trust failures and ProtocolErrors (50x), since we only want the certificate, and the service point is still populated at this point
        }
        else
        {
            $ErrorDetails = $_.Exception.Message
        }
    }
    catch {
        $ErrorDetails = $_.Exception.Message
    }

    if (($webRequest.ServicePoint.Certificate) -and ($webRequest.ServicePoint.Certificate.Handle -ne 0)) {
        # Commenting out SANs as they are useful to know in some scenarios but mostly just add noise for the purposes of this query
        # $Certificate = [Security.Cryptography.X509Certificates.X509Certificate2]$WebRequest.ServicePoint.Certificate.Handle
        # $SubjectAlternateNames = (($Certificate.Extensions | Where-Object {$_.Oid.Value -eq "2.5.29.17"}).Format(0) -split ", ") -replace ".+?=(.+)",'$1' -join ","
        $Issuer = ($webRequest.ServicePoint.Certificate.Issuer -replace "CN=(.+?),.+$",'$1')
        if ($Issuer -notmatch "^Microsoft |^Digicert |^Sectigo " -and $Issuer -notlike "") {
            $IssuerStatus = "CRITICAL - Non Standard Issuer - TLS Intercepted?"
        }
        else {$IssuerStatus = "Normal"}
        $Result = [PSCustomObject][Ordered]@{
            URL = $CoreURL
            ConnectionStatus = "Success"
            SubjectCN = $webRequest.ServicePoint.Certificate.Subject.Split(', ',[System.StringSplitOptions]::RemoveEmptyEntries)[0].Split('=')[1]
            Issuer = $Issuer
            IssuerStatus = $IssuerStatus
            # SANs = $SubjectAlternateNames
            ValidFrom = $webRequest.ServicePoint.Certificate.GetEffectiveDateString()
            ValidTo = $webRequest.ServicePoint.Certificate.GetExpirationDateString()
            ErrorDetails = $ErrorDetails
            ProxyUsed = $Proxy
        }
        
    $webRequest.ServicePoint.Certificate.Dispose()
    }
    else {
        $Result = [PSCustomObject][Ordered]@{
            URL = $CoreURL
            ConnectionStatus = "FAILURE"
            SubjectCN = "n/a"
            Issuer = "n/a"
            IssuerStatus = "n/a"
            # SANs = "n/a"
            ValidFrom = "n/a"
            ValidTo = "n/a"
            ErrorDetails = "n/a"
            ProxyUsed = $Proxy
        }     
    }
    [Net.ServicePointManager]::ServerCertificateValidationCallback = $null
    $Result
}
function Get-MDEURLCertInfo {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory)]
        [array]$URLList,
        [Parameter(Position = 1)]
        [string]$Proxy
    )
    $Result = @()
    $URLList | ForEach-Object {
        if ($Proxy) {
            $CertInfo = Get-MicrosoftSecureCertInfoHttp $_ -Proxy $Proxy
        }
        else {
            $CertInfo = Get-MicrosoftSecureCertInfoHttp $_
        }
        $Result += $CertInfo
    }
    $Result
}
if ($Proxy) {
    $MDEURLs = Get-MDEURLCertInfo $MDEEndpoints -Proxy $Proxy
}
else {
    $MDEURLs = Get-MDEURLCertInfo $MDEEndpoints
}
# By default we save to the local documents directory of the user running the script, feel free to change this
$MDEURLs | Export-Csv -NoTypeInformation ~\Documents\${Outputdate}_${ComputerName}_MDEURLs.csv
