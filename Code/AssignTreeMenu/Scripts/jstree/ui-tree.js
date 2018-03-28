var UITree = function () {
	var handleSample1 = function () {
		$(function () {
			$("#tree_1").jstree({
				"checkbox": {
					"keep_selected_style": false
				},
				"plugins": ["checkbox"]
			});
			$("#tree_1").bind("changed.jstree",
			function (e, data) {
				//alert(JSON.stringify(data));
			});
		});
	}

	return {
		//main function to initiate the module
		init: function () {
			handleSample1();
		}

	};

}();