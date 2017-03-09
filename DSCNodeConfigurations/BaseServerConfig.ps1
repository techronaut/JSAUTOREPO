#Requires -version 5.0
Configuration BaseServerConfig
    {
    param (
          )
    $zone = "Central Standard Time"
    $DrvLtr = "Z:"
    Import-DscResource –ModuleName PSDesiredStateConfiguration,
                                   xTimezone,
                                   cCDROMdriveletter

        xTimeZone zone {
            IsSingleInstance = 'Yes'
            TimeZone = $zone  
         }

         cCDROMdriveletter localhost {
            DriveLetter = $DrvLtr
            Ensure = 'Present'
         }
}