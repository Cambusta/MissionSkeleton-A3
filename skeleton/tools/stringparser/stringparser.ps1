<#
    .SYNOPSIS
    Converts .a3s file contents "File = '<content>'" pairs suitable to be used in Arma, with expanded tags 
    and newlines.

    .EXAMPLE
    .\stringparser.ps1 . > output.txt
#>

param(
    $Path,
    $StylesFilePath
)

function Style()
{
    param(
        [Parameter(Mandatory=$true)]
        $Path,

        [Parameter(Mandatory=$true)]
        $StylesFilePath
    )

    $sourceFiles = Get-SourceFiles -Path $Path
    $styles = Read-Styles -Path $StylesFilePath
    
    $armaStrings = @()
    
    foreach ($source in $sourceFiles)
    {
        Write-Host "Processing $($source.Name)"
        $string = Get-ArmaString -Path $source.FullName -Styles $styles

        $armaStrings += @{
            Name = $source.Basename
            Content = $string
        }
    }

    Write-Host

    foreach ($string in $armaStrings)
    {
        $varName = $string.Name
        $varValue = '"' + $string.Content + '";';

        Write-Output $("$varName = $varValue")
    }

    Write-Host

    Write-Host "Done!"
}

function Get-SourceFiles()
{
    param(
        [Parameter(Mandatory=$true)]
        $Path
    )

    $sourceFiles = Get-ChildItem -Path $path -Recurse -Filter "*.a3s"

    if (!$sourceFiles)
    {
        throw "No source files found"
    }

    return $sourceFiles
}

function Read-Styles()
{
    param(
        [Parameter(Mandatory=$true)]
        $Path
    )

    if (!(Test-Path $Path -PathType Leaf))
    {
        throw "Styles file not found"
    }

    $styles = ConvertFrom-Json $(Get-Content $Path -Raw)

    return $styles
}

function Get-ArmaString {
    param (
        [Parameter(Mandatory=$true)]
        $Path,

        [Parameter(Mandatory=$true)]
        $Styles
    )
    
    $content = Get-Content $Path -Raw -Encoding UTF8

    if (!$content)
    {
        throw "Empty file: $Path"
    }

    foreach ($styleItem in $Styles) {
        $content = $content.Replace($styleItem.Tag, $styleItem.Content)
    }

    $string = $content.Replace("`r`n", "<br/>")

    return $string
}

if (!$Path)
{
    $Path = $PSScriptRoot
}

if (!$StyleFilePath)
{
    $StylesFilePath = Join-Path $PSScriptRoot "styles.json"
}

try
{
    Style -Path $Path -StylesFilePath $StylesFilePath
}
catch
{
    Write-Host
    Write-Host "An error has occured" -ForegroundColor White -BackgroundColor Red -NoNewline
    Write-Host " $($_.Exception.Message)"
}