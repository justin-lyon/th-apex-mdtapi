public with sharing class UpdateContactPageLayout {

	public Metadata.Layout addLayoutItem() {
		List<Metadata.Metadata> layoutsList = Metadata.Operations.retrieve(
			Metadata.MetadataType.Layout,
			new List<String> {'Contact-Contact Layout'});
		Metadata.Layout layoutMetadata = (Metadata.Layout) layoutsList[0];

		Metadata.LayoutSection contactLayoutSection = null;
		Map<String, Metadata.LayoutSection> sectionsByName = new Map<String, Metadata.LayoutSection>();
		for(Metadata.LayoutSection section : layoutMetadata.LayoutSections) {
			sectionsByName.put(section.Label, section);
		}
		contactLayoutSection = sectionsByName.get('Additional Information');

		List<Metadata.LayoutColumn> contactColumns = contactLayoutSection.LayoutColumns;
		List<Metadata.LayoutItem> contactLayoutItems = contactColumns.get(0).LayoutItems;
		Metadata.LayoutItem newField = new Metadata.LayoutItem();
		newField.Behavior = Metadata.UiBehavior.Edit;
		newField.Field = 'AMAPI__Apex_MD_API_Twitter_name__c';

		contactLayoutItems.add(newField);

		return layoutMetadata;
	}
}