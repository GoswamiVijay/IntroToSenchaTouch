Ext.define('CitySearch.override.Flip', {
	override: 'Ext.fx.layout.card.Flip',

	onActiveItemChange: function(cardLayout, newItem, oldItem, options, controller) {

		if (Ext.isObject(newItem)) {
			var parent = newItem.element.getParent();
			parent.addCls('x-layout-card-perspective');

			this.on('animationend', function() {
				parent.removeCls('x-layout-card-perspective');
			}, this, {
				single: true
			});
			this.callParent(arguments);
		}	
		
	}
});