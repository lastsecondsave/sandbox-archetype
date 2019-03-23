function New-MavenProject {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Type,
        [Parameter(Mandatory = $true)]
        [string]$ArtifactId,
        [switch]$OpenInSublime
    )

    $opts = @(
        '-DarchetypeGroupId=lss'
        "-DarchetypeArtifactId=sandbox-archetype-${Type}"
        '-DarchetypeCatalog=local'
        '-DinteractiveMode=false'
        "-DartifactId=${ArtifactId}"
    )

    mvn archetype:generate @opts

    if (-not $LastExitCode -eq 0) { return }

    Set-Location $ArtifactId

    if ($OpenInSublime) { subl -n . }
}
