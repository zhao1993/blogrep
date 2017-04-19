function dragable(id) {
	var d = document, o = d.getElementById(id), s = o.style, x, y, p = 'onmousemove';
	o.onmousedown = function(e) {
		e = e || event;
		x = e.clientX - o.offsetLeft;
		y = e.clientY - o.offsetTop;
		d[p] = function(e) {
			e = e || event;
			s.left = e.clientX - x + 'px';
			s.top = e.clientY - y + 'px'
		};
		d.onmouseup = function() {
			d[p] = null
		}
	}
}
dragable("demo");
