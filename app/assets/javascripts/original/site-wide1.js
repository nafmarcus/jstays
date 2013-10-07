var tabs = Array()
tabs["main_tabs"] = "photos"
tabs["right_info"] = "at_a_glance"
function switch_tab (on_tab, tab_array_index) {
	document.getElementById(on_tab + "_tab").className = "selected"
	document.getElementById(on_tab).style.position = "static"
	document.getElementById(on_tab).style.display = "block"
	document.getElementById(tabs[tab_array_index] + "_tab").className = "unselected"
	document.getElementById(tabs[tab_array_index]).style.position = "absolute"
	document.getElementById(tabs[tab_array_index]).style.top = "0"
	document.getElementById(tabs[tab_array_index]).style.left = "-9999px"
	document.getElementById(tabs[tab_array_index]).style.display = "none"
	tabs[tab_array_index] = on_tab
} 
