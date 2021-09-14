
#
# Split by csv row number by powershell script
#

# get current directry
$currentpath = (Convert-Path .)
$currentpath.GetType().FullName

# if no sub directory, make directory
if (!(Test-Path $currentpath\sub)) {
    New-Item $currentpath\sub -ItemType Directory > $null
}


# get header info
$header = Get-Content iris.csv -TotalCount 1

# make files
$i=0
Get-Content iris.csv -ReadCount 10 | % {$_ | Out-File "$currentpath\sub\test_$i.csv" -Encoding UTF8 -Append; $i++}

# add header info



