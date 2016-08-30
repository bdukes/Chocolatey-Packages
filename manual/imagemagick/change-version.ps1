Param(
   [Parameter(Mandatory=$true)]
   [string]$version
)

ls *.nuspec -recurse | % {
    [xml]$manifest = get-content $_.FullName -Encoding UTF8
    $manifest.package.metadata.version = $version.PSObject.BaseObject # see http://stackoverflow.com/a/10359086/2688
    
    $id = $manifest.package.metadata.id;
    $dependencies = $manifest.package.metadata.dependencies.dependency;
    $dependency = $dependencies | ? { $_.id.StartsWith($id) }
    $dependency | % { $_.version = "[$version]" }
    
    $manifest.Save($_.FullName)
}