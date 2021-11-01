<?php
	// Content Type JSON
	header("Content-type: application/json");

	// Database connection
	$conn = new mysqli("localhost", "root", "", "customer_service");

	if ($conn->connect_error) {
		die("Conexión fallida a la base de datos!");
	}
	$res = array('error' => false);

	// Read data from database
	$action = 'read';
	$read_queue = false;
	$attend_queue = 0;

	if (isset($_GET['action'])) {
		$action = $_GET['action'];
	}
	
	if (isset($_GET['read_queue'])) {
		$read_queue = $_GET['read_queue'];
	}
	
	if (isset($_GET['queue'])) {
		$attend_queue = $_GET['queue'];
	}

	if ($read_queue == true) {
		$result = $conn->query("SELECT cq.id, cq.queue_id, TIMESTAMPDIFF(MINUTE, cq.created_at, CURRENT_TIMESTAMP()) AS 'minutes' FROM customer_queue AS cq INNER JOIN queue AS q ON q.id = cq.queue_id INNER JOIN status AS s ON s.id = cq.status_id WHERE s.id IN (1) AND q.id='$attend_queue'");

		while ($row = $result->fetch_assoc()) {
			$minutes = $row["minutes"];

			if ($attend_queue == '1') {
				if ($minutes >= 2) {
					$id = $row["id"];
				}
			} else {
				if ($minutes >= 3) {
					$id = $row["id"];
				}
			}

			$result = $conn->query("UPDATE customer_queue SET status_id=2, updated_at=CURRENT_TIMESTAMP() WHERE id='$id' AND queue_id='$attend_queue'");
	
			if ($result) {
				$res['message'] = "Cliente atendido con éxito";
			} else {
				$res['error']   = true;
				$res['message'] = "Atención del cliente, fallida!";
			}
		}
	}

	if ($action == 'read') {
		$result = $conn->query("SELECT cq.id, c.nid, c.name, q.id AS queue_id, q.name AS queue_name, s.id AS status_id, s.name AS status_name FROM customer_queue AS cq INNER JOIN customer AS c ON c.id = cq.customer_id INNER JOIN queue AS q ON q.id = cq.queue_id INNER JOIN status AS s ON s.id = cq.status_id WHERE s.id IN (1,2) ORDER BY s.id ASC, cq.id ASC");
		$customers  = array();

		while ($row = $result->fetch_assoc()) {
			array_push($customers, $row);
		}

        $res['customers'] = $customers;
	}

	// Insert data into database
	if ($action == 'create') {
		$name   = $_POST['name'];
		$nid    = $_POST['nid'];

		$result = $conn->query("INSERT INTO customer (name, nid) VALUES('$name', '$nid')");

		if ($result) {
			$rq = $conn->query("SELECT * FROM customer WHERE nid='$nid'");
			$customer_id = 0;
			
			while ($row = $rq->fetch_assoc()) {
				$queue_id = 0;
				$query_queue = $conn->query("SELECT DISTINCT q.id, q.name, COUNT(cq.id) AS 'count' FROM customer_queue AS cq INNER JOIN queue AS q ON q.id = cq.queue_id WHERE cq.status_id IN (1) GROUP BY q.name ORDER BY COUNT(cq.id) DESC LIMIT 1");
				
				if ($query_queue->num_rows > 0) {
					while ($row_2 = $query_queue->fetch_assoc()) {
						if ($row_2["id"] == 1) {
							$queue_id = 2;
						} else {
							$queue_id = 1;
						}
					}
				} else {
					$queue_id = rand(1,2);
				}
				
				$customer_id = $row["id"];
				$result_2 = $conn->query("INSERT INTO customer_queue (customer_id, queue_id) VALUES('$customer_id', '$queue_id')");

				if ($result_2) {
					$res['message'] = "Cliente registrado con éxito";
				}
			}
		} else {
			$res['error']   = true;
			$res['message'] = "Registro de cliente, fallido!";
		}
	}

	// Attend data
	if ($action == 'attend') {
		$id = $_POST['id'];
		$updated = date("Y-m-d H:i:s");

		$result = $conn->query("UPDATE customer_queue SET status_id=2, updated_at='$updated' WHERE id='$id'");

		if ($result) {
			$res['message'] = "Cliente atendido con éxito";
		} else {
			$res['error']   = true;
			$res['message'] = "Atención del cliente, fallida!";
		}
	}

	// Delete data
	if ($action == 'delete') {
		$id = $_POST['id'];
		$updated = date("Y-m-d H:i:s");
		
		$result = $conn->query("UPDATE customer_queue SET status_id=3, updated_at='$updated' WHERE id='$id'");

		if ($result) {
			$res['message'] = "Cliente eliminado con éxito";
		} else {
			$res['error']   = true;
			$res['message'] = "Eliminación del cliente, fallido!";
		}
	}

    // Close database connection
	$conn->close();

	// print json encoded data

	print_r(json_encode($res));
	die();
?>