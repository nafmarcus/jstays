var tabs = Array()
//tabs["main_tabs"] = "photos"
tabs["right_info"] = "at_a_glance"
function switch_tab (on_tab, tab_array_index) {
  var current_tab
  if (tab_array_index == 'main_tabs') {
    current_tab = $("#main_info table.tabs .selected").attr('id').replace('_tab', '')
  } else {
    current_tab = tabs[tab_array_index]
  }
  if (on_tab == current_tab) {
    return
  }
  document.getElementById(on_tab + "_tab").className = "selected"
  document.getElementById(on_tab).style.position = "static"
  document.getElementById(on_tab).style.display = "block"
  document.getElementById(current_tab + "_tab").className = "unselected"
  document.getElementById(current_tab).style.position = "absolute"
  document.getElementById(current_tab).style.top = "0"
  document.getElementById(current_tab).style.left = "-9999px"
  document.getElementById(current_tab).style.display = "none"
  tabs[tab_array_index] = on_tab
}
