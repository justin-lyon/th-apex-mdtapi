public with sharing class MetadataExample {

	public void updateMetadata() {
		Metadata.CustomMetadata customMetadata = new Metadata.CustomMetadata();
		customMetadata.FullName = 'MyNamespace__MyMetadataTypeName.MyMetadataRecordName';
		Metadata.CustomMetadataValue customField = new Metadata.CustomMetadataValue();
		customField.Field = 'customField__c';
		customField.Value = 'New value';
		customMetadata.Values.add(customField);

		Metadata.DeployContainer deployContainer = new Metadata.DeployContainer();
		deployContainer.addMetadata(customMetadata);
		Id asyncResultId = Metadata.Operations.enqueueDeployment(deployContainer, null);
	}
}