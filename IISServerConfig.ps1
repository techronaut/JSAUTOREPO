[DSCLocalConfigurationManager()]
Configuration IISServerConfig
{
    Node localhost
    {
        Settings
        {
            RefreshMode = "Pull"
            RebootNodeIfNeeded = $true
        }
        ConfigurationRepositoryWeb JSAUTOREPO
        {
            ServerURL                     = 'https://jsautorepo.blob.core.windows.net/jsautorepo'
            RegistrationKey = '140a952b-b9d6-406b-b416-e0f759c9c0e4'
            ConfigurationNames = @('BaseServerConfig','IISComposite')
            AllowUnsecureConnection = $true
        }     
         PartialConfiguration BaseServerConfig
        {
         Description = 'Configuration for the Base OS'
         ConfigurationSource = '[ConfigurationRepositoryWeb]JSAUTOREPO'
        }
         PartialConfiguration IISComposite
        {
         Description = 'Configuration for IIS'
         ConfigurationSource = '[ConfigurationRepositoryWeb]JSAUTOREPO'
         DependsOn = '[PartialConfiguration]BaseServerConfig'
        }
    }
}
 
