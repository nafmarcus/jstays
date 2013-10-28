function duration_click(term) {
	if (term == 'short_term') {
		document.getElementById('long_term_rate_fields').style.display = 'none';
		document.getElementById('short_term_rate_fields').style.display = 'block';
	}
	if (term == "long_term") {
		document.getElementById('long_term_rate_fields').style.display = 'block';
		document.getElementById('short_term_rate_fields').style.display = 'none';
	}
}
