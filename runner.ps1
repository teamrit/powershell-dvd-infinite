Add-Type -AssemblyName System.Windows.Forms

$DeviceWidth = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width;
$DeviceHeight = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height;

# start from 0, 0 
[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(0, 0)

$directionX = $true
$directionY = $true

while ($true) {

  # check if colliding with the edge of the screen

  $Pos = [System.Windows.Forms.Cursor]::Position

  if ($directionX) {
    $x = $Pos.X + 1
  }
  else {
    $x = $Pos.X - 1
  }
  if ($directionY) {
    $y = $Pos.Y + 1
  }
  else {
    $y = $Pos.Y - 1
  }

  if ($y -eq 0) {
    $directionY = $true
  }
  if ($x -eq 0) {
    $directionX = $true
  }
  if ($y -eq $DeviceHeight) {
    $directionY = $false
  }
  if ($x -eq $DeviceWidth) {
    $directionX = $false
  }

  # set cursor position to the new x and y
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  
  # speed of the movement of cursor "per-movement"
  Start-Sleep -Milliseconds 1
}