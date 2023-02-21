#Define the color palette
$ThemePalette =
@{
"themePrimary" = "#0088ce";
"themeLighterAlt" = "#000608";
"themeLighter" = "#001621";
"themeLight" = "#00293e";
"themeTertiary" = "#00537c";
"themeSecondary" = "#0079b6";
"themeDarkAlt" = "#1594d3";
"themeDark" = "#34a3da";
"themeDarker" = "#64b9e4";
"neutralLighterAlt" = "#2a2045";
"neutralLighter" = "#291f44";
"neutralLight" = "#281e42";
"neutralQuaternaryAlt" = "#251c3d";
"neutralQuaternary" = "#231b3a";
"neutralTertiaryAlt" = "#221a38";
"neutralTertiary" = "#c8c8c8";
"neutralSecondary" = "#d0d0d0";
"neutralPrimaryAlt" = "#dadada";
"neutralPrimary" = "#ffffff";
"neutralDark" = "#f4f4f4";
"black" = "#f8f8f8";
"white" = "#2b2147";
}

Add-SPOTheme -Identity "ADT Theme" -Palette $ThemePalette -IsInverted $false