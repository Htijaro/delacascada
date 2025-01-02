js
const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

allSideMenu.forEach(item => {
	const li = item.parentElement;

	item.addEventListener('click', function () {
		allSideMenu.forEach(i => {
			i.parentElement.classList.remove('active');
		})
		li.classList.add('active');
	})
});




// TOGGLE SIDEBAR
const menuBar = document.querySelector('#content nav .bx.bx-menu');
const sidebar = document.getElementById('sidebar');

menuBar.addEventListener('click', function () {
	sidebar.classList.toggle('hide');
})


//  Search

const searchButton = document.querySelector('#content nav form .form-input button');
const searchButtonIcon = document.querySelector('#content nav form .form-input button .bx');
const searchForm = document.querySelector('#content nav form');

searchButton.addEventListener('click', function (e) {
	if (window.innerWidth < 576) {
		e.preventDefault();
		searchForm.classList.toggle('show');
		if (searchForm.classList.contains('show')) {
			searchButtonIcon.classList.replace('bx-search', 'bx-x');
		} else {
			searchButtonIcon.classList.replace('bx-x', 'bx-search');
		}
	}
})





if (window.innerWidth < 768) {
	sidebar.classList.add('hide');
} else if (window.innerWidth > 576) {
	searchButtonIcon.classList.replace('bx-x', 'bx-search');
	searchForm.classList.remove('show');
}


window.addEventListener('resize', function () {
	if (this.innerWidth > 576) {
		searchButtonIcon.classList.replace('bx-x', 'bx-search');
		searchForm.classList.remove('show');
	}
})



const switchMode = document.getElementById('switch-mode');

switchMode.addEventListener('change', function () {
	if (this.checked) {
		document.body.classList.add('dark');
	} else {
		document.body.classList.remove('dark');
	}
})

// Llamar precios formularios

(function () {
	'use strict';

	var forms = document.querySelectorAll('.needs-validation');

	Array.prototype.slice.call(forms)
	  .forEach(function (form) {
		form.addEventListener('submit', function (event) {
		  if (!form.checkValidity()) {
			event.preventDefault();
			event.stopPropagation();
		  }

		  form.classList.add('was-validated');
		}, false);
	  });
  })();

  function updatePrice() {
	  var producto_id = $('#id_producto').val();
	  var cantidad = $('#id_cantidad').val();

	  if (producto_id) {
		  $.ajax({
			  url: '/AppVentas/api/precio-producto/' + producto_id + '/',
			  type: 'GET',
			  success: function(data) {
				  if (data.precio) {
					  var precio = parseFloat(data.precio);
					  $('#id_precioproductoinv').val(precio.toFixed(2));
					  var total = precio * cantidad;
					  $('#id_total').val(total.toFixed(2));
				  }
			  }
		  });
	  }
  }

  $(document).ready(function() {
	  $('#id_producto').change(updatePrice);
	  $('#id_cantidad').on('input', updatePrice);
  });

  function updateTotal() {
	  var cantidad = document.getElementById("id_cantidad").value;
	  var precio = document.getElementById("id_precioproductoinv").value;
	  var total = parseFloat(cantidad) * parseFloat(precio);
	  document.getElementById("id_total").value = total.toFixed(2);
  }

  window.onload = updatePrice;
  
  document.getElementById("id_producto").addEventListener("change", updatePrice);
  document.getElementById("id_cantidad").addEventListener("input", updateTotal);