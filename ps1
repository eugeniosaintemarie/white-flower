Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseMover {
    [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint cButtons, uint dwExtraInfo);

    public const int MOUSEEVENTF_MOVE = 0x0001;

    public static void MoveMouse(int x, int y) {
        mouse_event(MOUSEEVENTF_MOVE, (uint)x, (uint)y, 0, 0);
    }
}
"@

$counter = 0
while ($true) {
    [MouseMover]::MoveMouse(1, 0)
    Start-Sleep -Seconds 30
    [MouseMover]::MoveMouse(-1, 0)
    Start-Sleep -Seconds 30

    $counter++
    Write-Host "Vuelta $counter"
}
