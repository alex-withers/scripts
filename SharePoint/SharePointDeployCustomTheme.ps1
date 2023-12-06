#Define the color palette
$ThemePalette =
@{
"themePrimary" = "#fe00df";
"themeLighterAlt" = "#fff5fe";
"themeLighter" = "#ffd6fa";
"themeLight" = "#ffb3f6";
"themeTertiary" = "#ff66ed";
"themeSecondary" = "#ff1fe5";
"themeDarkAlt" = "#e600cb";
"themeDark" = "#c200ab";
"themeDarker" = "#8f007e";
"neutralLighterAlt" = "#000000";
"neutralLighter" = "#000000";
"neutralLight" = "#000000";
"neutralQuaternaryAlt" = "#000000";
"neutralQuaternary" = "#000000";
"neutralTertiaryAlt" = "#000000";
"neutralTertiary" = "#c8c8c8";
"neutralSecondary" = "#d0d0d0";
"neutralPrimaryAlt" = "#dadada";
"neutralPrimary" = "#ffffff";
"neutralDark" = "#f4f4f4";
"black" = "#f8f8f8";
"white" = "#000000";
}

Add-SPOTheme -Identity "Shine Theme" -Palette $ThemePalette -IsInverted $false