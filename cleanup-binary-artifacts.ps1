$repo = "C:\Users\Maclindows\Music\Adverts\Libretime-4.5.0+Icecast2.5.0+Liquidsoap2.0.7"

$paths = @(
  "debian\.debhelper",
  "debian\debhelper-build-stamp",
  "debian\files",
  "debian\libretime",
  "debian\libretime.substvars"
)

foreach ($path in $paths) {
  $full = Join-Path $repo $path
  if (Test-Path -LiteralPath $full) {
    Remove-Item -LiteralPath $full -Recurse -Force
  }
}

$patterns = @(
  "libretime_*.deb",
  "libretime_*.ddeb",
  "libretime_*.buildinfo",
  "libretime_*.changes"
)

foreach ($pattern in $patterns) {
  Get-ChildItem -LiteralPath $repo -Filter $pattern -ErrorAction SilentlyContinue | ForEach-Object {
    Remove-Item -LiteralPath $_.FullName -Force
  }
}

"Cleanup complete."
"Note: bundle-rootfs/ and Upload/ were intentionally left untouched."
& git -C $repo status --short
