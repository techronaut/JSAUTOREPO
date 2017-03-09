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
        ConfigurationRepositoryWeb AzureAutomationDSC
        {
            ServerURL                     = 'https://wcus-agentservice-prod-1.azure-automation.net/accounts/83d639be-538a-42e0-91cc-e2bc9f1ef2c5'
            RegistrationKey = 'MjH85tIA/PloJyFwlHHT58adpYB8p3wq5bHdQ+MsN2PJFRWY9L0gjQQ45vHqpzTmQeKG7ehdB3UWMY1VDUW0Ow=='
            ConfigurationNames = @('BaseServerConfig','IISComposite')
            AllowUnsecureConnection = $true
        }     
         PartialConfiguration BaseServerConfig
        {
         Description = 'Configuration for the Base OS'
         ConfigurationSource = '[ConfigurationRepositoryWeb]AzureAutomationDSC'
        }
         PartialConfiguration IISComposite
        {
         Description = 'Configuration for IIS'
         ConfigurationSource = '[ConfigurationRepositoryWeb]AzureAutomationDSC'
         DependsOn = '[PartialConfiguration]BaseServerConfig'
        }
    }
}
 
