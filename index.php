<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Ticket de Atención al Cliente</title>
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/styles.min.css">
	<script src="./js/axios.min.js"></script>
</head>
<body>
	<div id="root">
		<nav class="navbar navbar-expand-lg navbar-dark">
			<a class="navbar-brand" href="#"><img src="images/logo.png" alt="vue.js logo" class="logo-custom">ue.js</a>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<button class="btn btn-link" @click="showingaddModal = true;">Agregar Cliente</button>
				</li>
			</ul>
		</nav>
		<div class="container p-5">
			<div class="row">
				<div class="alert alert-danger col-md-6" id="alertMessage" role="alert" v-if="errorMessage">
					{{ errorMessage }}
				</div>
				<div class="alert alert-success col-md-6" id="alertMessage" role="alert" v-if="successMessage">
					{{ successMessage }}
				</div>
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th>ID</th>
							<th>NID</th>
							<th>Nombre</th>
							<th>Cola #</th>
							<th>Estatus</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody class="tbody-custom">
						<tr v-for="customer in customers">
							<td>{{customer.id}}</td>
							<td>{{customer.nid}}</td>
							<td>{{customer.name}}</td>
							<td>{{customer.queue_name}}</td>
							<td>{{customer.status_name}}</td>
							<td>
								<button @click="showingattendModal = true; selectCustomer(customer);" class="btn btn-warning" v-if="customer.status_name === 'EN ESPERA'">Atender</button>
								<button @click="showingdeleteModal = true; selectCustomer(customer);" class="btn btn-danger" v-if="customer.status_name === 'ATENDIDO'">Eliminar</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
    	<!-- add modal -->
		<div class="modal col-md-6" id="addmodal" v-if="showingaddModal">
            <div class="modal-head">
                <p class="p-left p-2">Agregar Cliente</p>
                <hr/>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label for="nid">Número de Identificación</label>
                        <input type="text" id="nid" class="form-control" v-model="newCustomer.nid">
                        <label for="name">Nombre</label>
                        <input type="text" id="name" class="form-control" v-model="newCustomer.name">
                    </div>
                    <hr/>
                    <button type="button" class="btn btn-success" @click="showingaddModal = false; addCustomer();">Guardar</button>
                    <button type="button" class="btn btn-danger" @click="showingaddModal = false;">Close</button>
                </div>
            </div>
        </div>
        <!-- attend modal -->
		<div class="modal col-md-6" id="attendmodal" v-if="showingattendModal">
			<div class="modal-head">
				<p class="p-left p-2">Atender Cliente</p>
				<hr/>
				<div class="modal-body">
                    <div class="col-md-12">
                        <label for="nid">Número de Identificación</label>
                        <input type="text" id="nid" class="form-control" v-model="clickedCustomer.nid" readonly="readonly">
                        <label for="name">Nombre</label>
                        <input type="text" id="name" class="form-control" v-model="clickedCustomer.name" readonly="readonly">
                    </div>
					<hr/>
                    <button type="button" class="btn btn-success" @click="showingattendModal = false; attendCustomer();">Atender</button>
                    <button type="button" class="btn btn-danger" @click="showingattendModal = false;">Cerrar</button>
				</div>
			</div>
		</div>
		<!-- delete data -->
		<div class="modal col-md-6" id="deletemodal" v-if="showingdeleteModal">
			<div class="modal-head">
				<p class="p-left p-2">Eliminar Cliente</p>
				<hr/>
				<div class="modal-body">
                    <center>
                        <p>¿Está seguro que desea eliminar el cliente?</p>
                        <h3>{{clickedCustomer.name}}</h3>
                    </center>
                    <hr/>
                    <button type="button" class="btn btn-danger" @click="showingdeleteModal = false; deleteCustomer();">Si</button>
                    <button type="button" class="btn btn-warning" @click="showingdeleteModal = false;">No</button>
				</div>
			</div>
		</div>
	</div>
	<script src="./js/jquery.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/vue.min.js"></script>
	<script src="./js/app.js"></script>
</body>
</html>