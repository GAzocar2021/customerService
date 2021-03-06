var app = new Vue({
    el: "#root",
    data: {
        showingaddModal: false,
        showingattendModal: false,
        showingdeleteModal: false,
        errorMessage: "",
        successMessage: "",
        customers: [],
        newCustomer: {name: "", nid: ""},
        clickedCustomer: {},
    },
    mounted: function () {
        console.log("Vue.js está ejecutandose...");
        this.getQueue();
        this.getQueue2();
        this.getAllCustomers();
    
        setInterval(()=>{
            this.getQueue();
            this.getQueue2();
            this.getAllCustomers();
        }, 10000);
    },
    methods: {
        getQueue: function () {
            axios.get('http://localhost/customer_service/api/database_mysql.php?read_queue=true&queue=1')
            .then(function (response) {
                console.log(response);
            })
        },
        getQueue2: function () {
            axios.get('http://localhost/customer_service/api/database_mysql.php?read_queue=true&queue=2')
            .then(function (response) {
                console.log(response);
            })
        },
        getAllCustomers: function () {
            axios.get('http://localhost/customer_service/api/database_mysql.php?action=read')
            .then(function (response) {
                console.log(response);
  
                if (response.data.error) {
                    app.errorMessage = response.data.message;
                } else {
                    app.customers = response.data.customers;
                }
            })
        },
        addCustomer: function () {
            var formData = app.toFormData(app.newCustomer);
            
            axios.post('http://localhost/customer_service/api/database_mysql.php?action=create', formData)
            .then(function (response) {
                console.log(response);
                app.newCustomer = {name: "", nid: ""};
  
                if (response.data.error) {
                    app.errorMessage = response.data.message;
                } else {
                    app.successMessage = response.data.message;
                    app.getAllCustomers();
                }
            });
        },
        attendCustomer: function () {
            var formData = app.toFormData(app.clickedCustomer);

            axios.post('http://localhost/customer_service/api/database_mysql.php?action=attend', formData)
            .then(function (response) {
                console.log(response);
                app.clickedCustomer = {};
  
                if (response.data.error) {
                    app.errorMessage = response.data.message;
                } else {
                    app.successMessage = response.data.message;
                    app.getAllCustomers();
                }
            });
        },
        deleteCustomer: function () {
            var formData = app.toFormData(app.clickedCustomer);
            
            axios.post('http://localhost/customer_service/api/database_mysql.php?action=delete', formData)
            .then(function (response) {
                console.log(response);
                app.clickedCustomer = {};
  
                if (response.data.error) {
                    app.errorMessage = response.data.message;
                } else {
                    app.successMessage = response.data.message;
                    app.getAllCustomers();
                }
            })
        },
        selectCustomer(customer) {
            app.clickedCustomer = customer;
        },
        toFormData: function (obj) {
            var form_data = new FormData();

            for (var key in obj) {
                form_data.append(key, obj[key]);
            }

            return form_data;
        },
        clearMessage: function (argument) {
            app.errorMessage = "";
            app.successMessage = "";
        },
    }
});